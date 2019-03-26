library(openintro)


### Name: house
### Title: United States House of Representatives historical make-up
### Aliases: house
### Keywords: datasets

### ** Examples

data(house)

#=====> Examine two-party relationship since 1855 <=====#
these <- 34:112
COL   <- c("#EEDDBB", "#DDEEBB", "#DDDDDD",
           "#BBDDEE", "#EEE5E5", "#EECCCC")
party <- c("#2222FF", "#FF2222")
par(las=1)
plot(house$yearStart[these], 100*house$np1[these]/house$seats[these],
      type="n", xlab="Year", ylab="Percent of House seats", ylim=c(11, 93))
rect(1861.3, -1000, 1865.3, 1000, col=COL[1], border="#FFFFFF")
rect(1914.5, -1000, 1918.9, 1000, col=COL[2], border="#FFFFFF")
rect(1929, -1000, 1939, 1000, col=COL[3], border="#FFFFFF")
rect(1939.7, -1000, 1945.6, 1000, col=COL[4], border="#FFFFFF")
rect(1955.8, -1000, 1965.3, 1000, col=COL[5], border="#E2E2E2")
rect(1965.3, -1000, 1975.4, 1000, col=COL[6], border="#E2E2E2")
lines(house$yearStart[these], 100*house$np1[these]/house$seats[these],
      col=party[1])
lines(house$yearStart[these], 100*house$np2[these]/house$seats[these],
      col=party[2])
legend("topleft", lty=c(1,1), col=party,
      c("Democrats", "Republicans"), bg="#FFFFFF")
legend("topright", fill=COL,
      c("Civil War", "World War I", "Great Depression", "World War II",
        "Vietnam War Start", "Vietnam War Escalated"),
      bg="#FFFFFF", border="#FFFFFF")



