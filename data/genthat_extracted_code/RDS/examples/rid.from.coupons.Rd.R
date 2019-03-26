library(RDS)


### Name: rid.from.coupons
### Title: Determines the recruiter.id from recruitment coupon information
### Aliases: rid.from.coupons

### ** Examples

fpath <- system.file("extdata", "nyjazz.csv", package="RDS")
dat <- read.csv(fpath)
dat$recruiter.id <- rid.from.coupons(dat,"own.coupon",
                      paste0("coupon.",1:7),"id")

#create and rds.data.frame
rds <- as.rds.data.frame(dat,network.size="network.size")



