### R code from vignette source 'Drawdowns_streaks.Rnw'

###################################################
### code chunk number 1: Drawdowns_streaks.Rnw:25-28
###################################################
options(continue = "  ", digits = 3, width = 60, useFancyQuotes = FALSE)
pv <- packageVersion("PMwR")
pv <- gsub("(.*)[.](.*)", "\\1-\\2", pv)


###################################################
### code chunk number 2: Drawdowns_streaks.Rnw:42-46
###################################################
library("PMwR")
library("zoo")
data("DAX")
dax <- zoo(DAX[[1]], as.Date(row.names(DAX)))


###################################################
### code chunk number 3: Drawdowns_streaks.Rnw:54-60
###################################################
library("PMwR")
library("zoo")
dax <- zoo(DAX[[1]], as.Date(row.names(DAX)))
dd <- drawdowns(dax)
dd <- dd[order(dd$max, decreasing = TRUE), ]  ## sort by size
dd


###################################################
### code chunk number 4: Drawdowns_streaks.Rnw:63-68
###################################################
par(bty = "n", las = 1, tck = 0.01, 
    mar = c(3, 3, 1, 1), mgp = c(2, 0.5, 0), ps = 9)
plot(dax, xlab = "", ylab = "DAX")
abline(v = dd$peak[1])
abline(v = dd$trough[1])


###################################################
### code chunk number 5: Drawdowns_streaks.Rnw:79-81
###################################################
up_down <- streaks(dax, up = 0.1, down = -0.1)
up_down


###################################################
### code chunk number 6: Drawdowns_streaks.Rnw:91-114
###################################################
par(bty = "n", 
    las = 1, 
    tck = 0.01, 
    mar = c(3, 3, 1, 1), mgp = c(2, 0.5, 0), ps = 9)
plot(index(dax), rep(100, length(index(dax))), 
     type = "n",
     main = "", xlab = "", ylab = "Streak in %",
     log = "y", ylim = range(100*up_down$return+100),
     xaxt = "n", yaxt = "n")

x <- axis.Date(1, index(dax), lwd = 0)
abline(v = x, col = grey(0.7), lwd = 0.25)

axis(2, lwd = 0, at = axTicks(2), labels = axTicks(2)-100)
abline(h = 100, lwd = 0.5, col = grey(.5))
abline(h = axTicks(2), col = grey(0.7), lwd = 0.25)

for (i in seq_len(nrow(up_down))) {    
    lines(scale1(window(dax, 
                        start = up_down$start[i],
                        end = up_down$end[i]),
                 level = 100))
}


