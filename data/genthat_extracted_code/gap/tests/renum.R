# 20-1-2016 MRC-Epid JHZ

renum <- function(data,each=FALSE,stable_order=FALSE)
{
idn <- 1:dim(data)[1]
if(!stable_order) data <- cbind(data,idn)
ps <- vector()
for(i in unique(data[,1]))
{
  p <- subset(data,i==data[,1])
  n <- dim(p)[1]
  fid <- mid <- rep(0,n)
  for(k in 1:n)
  {
     f <- p[k,3]
     for(j in 1:n)
     if(!is.na(f) & f==p[j,2]) {fid[k]=ifelse(each,idn[j],p[j,5]);break}
     m <- p[k,4]
     for(j in 1:n)
     if(!is.na(m) & m==p[j,2]) {mid[k]=ifelse(each,idn[j],p[j,5]);break}
  }
  if(each) np <- cbind(p[,-5],idn[1:n],fid,mid)
  else np <- cbind(p,fid,mid)
  ps <- rbind(ps,np)
}
invisible(ps)
}
library(foreign)
d <- read.dta("pg.dta")
old_id <- c("pedno","shareid","fshare","mshare")
p0 <- renum(d[c(old_id,"idn")],stable_order=TRUE)
p1 <- renum(d[old_id])
p2 <- renum(d[old_id],each=TRUE)
colnames(p0) <- colnames(p1) <- colnames(p2) <- c(old_id,"id","fid","mid")
