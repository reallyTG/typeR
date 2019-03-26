library(rpms)


### Name: predict.rpms
### Title: predict.rpms
### Aliases: predict.rpms predict

### ** Examples

{

# get rpms model of mean Soc Security income for families headed by a 
# retired person by several factors
r1 <-rpms(SOCRRX~EDUCA+AGE+BLS_URBN+REGION, 
          data=CE[which(CE$INCNONWK==1),], clusters=~CID) 

r1

# first 10 predicted means
predict(r1, CE[10:20, ])

}




