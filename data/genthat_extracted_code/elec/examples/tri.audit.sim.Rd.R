library(elec)


### Name: tri.audit.sim
### Title: tri.audit.sim
### Aliases: tri.audit.sim

### ** Examples


  data(santa.cruz)
  Z = elec.data(santa.cruz, C.names=c("leopold","danner"))
  Z$V$e.max = maximumMarginBound( Z )
  ## Sample from fake truth, see how many errors we get.
  tri.audit.sim( Z, 10,  p_d=0.25, swing=10, return.type="precinct" )

  ## what does distribution look like?
  res = replicate( 200, tri.audit.sim( Z, 10,  p_d=0.25, swing=10 ) )
  apply(res,1, summary) 
  hist( res[2,], main="Distribution of maximum size taint" )



