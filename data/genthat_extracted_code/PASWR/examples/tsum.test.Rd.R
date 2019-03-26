library(PASWR)


### Name: tsum.test
### Title: Summarized t-test
### Aliases: tsum.test
### Keywords: htest

### ** Examples

round(tsum.test(mean.x=53/15, mean.y=77/11, s.x=sqrt((222-15*(53/15)^2)/14),
s.y=sqrt((560-11*(77/11)^2)/10), n.x=15, n.y=11, var.equal= TRUE)$conf, 2)
        # Example 8.13 from PASWR
tsum.test(mean.x=4, s.x=2.89, n.x=25, mu=2.5)
        # Example 9.8 from PASWR



