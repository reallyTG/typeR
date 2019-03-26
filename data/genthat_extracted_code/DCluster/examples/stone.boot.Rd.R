library(DCluster)


### Name: stone.boot
### Title: Generate Boostrap Replicates of Stone's Statistic
### Aliases: stone.boot stone.pboot
### Keywords: spatial

### ** Examples

library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))
sids<-cbind(sids, x=nc.sids$x, y=nc.sids$y)

niter<-100

#All Tests are performed around county 78.


#Permutation  model
st.perboot<-boot(sids, statistic=stone.boot, R=niter, region=78)
plot(st.perboot)#Display results

#Multinomial model
st.mboot<-boot(sids, statistic=stone.pboot, sim="parametric",
  ran.gen=multinom.sim,  R=niter, region=78)
plot(st.mboot)#Display results

#Poisson model
st.pboot<-boot(sids, statistic=stone.pboot, sim="parametric",
  ran.gen=poisson.sim,  R=niter, region=78)
plot(st.pboot)#Display results

#Poisson-Gamma model
st.pgboot<-boot(sids, statistic=stone.pboot, sim="parametric",
  ran.gen=negbin.sim, R=niter, region=78)
plot(st.pgboot)#Display results





