library(NFWdist)


### Name: nfw
### Title: The Standard Distribution Functions for the 3D NFW Profile
### Aliases: NFW NFWdist nfw dnfw pnfw qnfw rnfw
### Keywords: nfw

### ** Examples

#Both the PDF (dnfw) integrated up to x, and CDF at q (pnfw) should be the same:
#0.373, 0.562, 0.644, 0.712

for(con in c(1,5,10,20)){
  print(integrate(dnfw, lower=0, upper=0.5, con=con)$value)
  print(pnfw(0.5, con=con))
}

#The qnfw should invert the pnfw, returning the input vector (1:9)/10:
for(con in c(1,5,10,20)){
  print(qnfw(p=pnfw(q=(1:9)/10,con=con), con=con))
}

#The sampling from rnfw should recreate the expected PDF from dnfw:

for(con in c(1,5,10,20)){
  plot(density(rnfw(1e6,con=con), bw=0.01))
  lines(seq(0,1,len=1e3), dnfw(seq(0,1,len=1e3),con=con),col='red')
  legend('topright',legend=paste('con =',con))
}



