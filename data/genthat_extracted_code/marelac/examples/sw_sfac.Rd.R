library(marelac)


### Name: sw_sfac
### Title: Salinity conversion factors
### Aliases: sw_sfac
### Keywords: datasets

### ** Examples


mf <- par(mfrow = c(2, 1))
ma <- par(mar = c(3, 5, 2, 5))

dsal <- t(sw_sfac$del_sa[1, , ])
dsal [dsal < -90] <- NA
image(sw_sfac$longs, sw_sfac$lats, dsal, col = femmecol(100),
      asp = TRUE, xlab = "dg", ylab = "dg",
      main = "salinity conversion - p = 0 bar")
contour(sw_sfac$longs, sw_sfac$lats, dsal, asp = TRUE, add = TRUE)

dsal <- t(sw_sfac$del_sa[5,,])  # 5th depth level sw_sfac$p[5]
dsal [dsal < -90]<-NA
image(sw_sfac$longs, sw_sfac$lats, dsal, col = femmecol(100),
      asp = TRUE, xlab = "dg", ylab = "dg",
      main = "salinity conversion - p = 4 bar")
contour(sw_sfac$longs, sw_sfac$lats, dsal, asp = TRUE, add = TRUE)

par("mfrow" = mf)
par("mar" = ma)



