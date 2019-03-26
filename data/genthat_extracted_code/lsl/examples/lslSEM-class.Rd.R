library(lsl)


### Name: lslSEM-class
### Title: A Reference Class for Learning a SEM model via penalized
###   likelihood.
### Aliases: lslSEM-class lslSEM

### ** Examples

#Example: Holzinger and Swineford (1939) Data#
lambda <- matrix(NA, 9, 3)
lambda[c(1,2,3), 1] <- lambda[c(4,5,6), 2] <- lambda[c(7,8,9), 3] <- 1

rc_sem <- lslSEM()
rc_sem$input(raw = lavaan::HolzingerSwineford1939)
rc_sem$specify(pattern = list(lambda = lambda))
rc_sem$learn(penalty = list(type = "l1", gamma = seq(.05, .10, .05)), variable = 7:15)
rc_sem$draw(type = "individual", object = "lambda")
rc_sem$summarize(type = "overall")
rc_sem$summarize(type = "individual")

 



