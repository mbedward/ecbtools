pointDistSample=function(points,sample.size,id=T){
  cdist=spatstat::crossdist(X=coordinates(points)[,1],Y=coordinates(points)[,2],x2=coordinates(points)[,1],y2=coordinates(points)[,2])
  cmn=apply(cdist,1,mean)
  mdist=cmn
  if(id==T){mdist=sqrt(mdist)}
  mdist=(ecbtools::normalize(mdist)/dim(points)[1])
  selvec=1:(dim(points)[1])
  grb=sample(selvec,size=sample.size,replace=F,prob=mdist)
  new=points[grb,]
  new
}

pointnnSample=function(points,sample.size,id=T){
  cdist=spatstat::nndist(X=coordinates(points)[,1],Y=coordinates(points)[,2])
  mdist=cdist
  if(id==T){mdist=sqrt(mdist)}
  mdist=(ecbtools::normalize(mdist)/dim(points)[1])
  selvec=1:(dim(points)[1])
  grb=sample(selvec,size=sample.size,replace=F,prob=mdist)
  new=points[grb,]
  new
}
