## ----include=FALSE-------------------------------------------------------
library(NFWdist, quietly=TRUE)

## ------------------------------------------------------------------------
for(con in c(1,5,10,20)){
  print(integrate(dnfw, lower=0, upper=0.5, con=con)$value)
  print(pnfw(0.5, con=con))
}

## ------------------------------------------------------------------------
for(con in c(1,5,10,20)){
  print(qnfw(p=pnfw(q=(1:9)/10,con=con), con=con))
}

## ------------------------------------------------------------------------
for(con in c(1,5,10,20)){
  par(mar=c(4.1,4.1,1.1,1.1))
  plot(density(rnfw(1e6,con=con), bw=0.01))
  lines(seq(0,1,len=1e3), dnfw(seq(0,1,len=1e3),con=con),col='red')
  legend('topright',legend=paste('con =',con))
}

