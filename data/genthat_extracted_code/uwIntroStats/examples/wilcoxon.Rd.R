library(uwIntroStats)


### Name: wilcoxon
### Title: Wilcoxon Signed Rank and Mann-Whitney-Wilcoxon Rank Sum Test
### Aliases: wilcoxon wilcoxon.do print.wilcoxon wilcoxon.default
### Keywords: ~kwd1 ~kwd2

### ** Examples

#- Create the data -#
cf <- c(1153, 1132, 1165, 1460, 1162, 1493, 1358, 1453, 1185, 1824, 1793, 1930, 2075)
healthy <- c(996, 1080, 1182, 1452, 1634, 1619, 1140, 1123, 1113, 1463, 1632, 1614, 1836)

#- Perform the test -#
wilcoxon(cf, healthy, paired=TRUE)

#- Perform the test -#
wilcoxon(cf, healthy, conf.int=TRUE)



