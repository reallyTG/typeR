library(BSDA)


### Name: Birth
### Title: Live birth rates in 1990 and 1998 for all states
### Aliases: Birth
### Keywords: datasets

### ** Examples


rate1998 <- subset(Birth, year == "1998", select = rate)
stem(x = rate1998$rate, scale = 2)
hist(rate1998$rate, breaks = seq(10.9, 21.9, 1.0), xlab = "1998 Birth Rate",
     main = "Figure 1.14 in BSDA", col = "pink")
hist(rate1998$rate, breaks = seq(10.9, 21.9, 1.0), xlab = "1998 Birth Rate",
     main = "Figure 1.16 in BSDA", col = "pink", freq = FALSE)      
lines(density(rate1998$rate), lwd = 3)
rm(rate1998)




