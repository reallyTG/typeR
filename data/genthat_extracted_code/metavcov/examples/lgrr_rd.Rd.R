library(metavcov)


### Name: lgrr_rd
### Title: Covariance between log risk ratio and risk difference
### Aliases: lgrr_rd

### ** Examples

## simple example
lgrr_rd(r=0.71,n1c=30,n2c=35,n1t=28,n2t=32,
        s2c=5,s2t=8,f2c=30,f2t=24,
        s1c=5,s1t=8,f1c=25,f1t=20)
## calculate covariances for variable D and DD in Geeganage2010 data
attach(Geeganage2010)
D_DD=unlist(lapply(1:nrow(Geeganage2010),function(i){lgrr_rd(r=0.71,
        n1c=nc_SBP[i],n2c=nc_DD[i],
        n1t=nt_SBP[i],n2t=nt_DD[i],s2t=st_DD[i],s2c=sc_DD[i],
        f2c=nc_DD[i]-sc_DD[i],f2t=nt_DD[i]-st_DD[i],
        s1t=st_D[i],s1c=sc_D[i],f1c=nc_D[i]-sc_D[i],f1t=nt_D[i]-st_D[i])}))
D_DD



