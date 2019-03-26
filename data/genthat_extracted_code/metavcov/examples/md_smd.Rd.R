library(metavcov)


### Name: md_smd
### Title: Covariance between mean difference and standardized mean
###   difference
### Aliases: md_smd

### ** Examples

## simple example
md_smd(r=0.71,n1c=34,n2c=35,n1t=25,n2t=32,
       sd1t=0.6,sd2t=0.4,sd1c=8,sd2c=0.9)
## calculate covariances for variable SBP and DBP in Geeganage2010 data
attach(Geeganage2010)
SBP_DBP=unlist(lapply(1:nrow(Geeganage2010),function(i){md_smd(r=0.71,
                n1c=nc_SBP[i],n2c=nc_DBP[i],n1t=nt_SBP[i],n2t=nt_DBP[i],
                sd1t=sdt_SBP[i],sd2t=sdt_DBP[i],
                sd1c=sdc_SBP[i],sd2c=sdc_SBP[i])}))
SBP_DBP



