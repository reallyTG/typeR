library(testthat)
library(VBTree)

# test for all functions:

A <- c("Stress", "Strain")
T <- c("900", "950", "1000", "1050", "1100", "1150", "1200")
S <- c("0.001", "0.01", "0.1", "1")
D <- c("0.6")

x <- list(A, T, S, D)

rm(list = c("A", "T", "S", "D"))

vbt <- dl2vbt(x)
dl <- vbt2dl(vbt)

inq.vbt <- vbtinq(vbt, c(2,2,-1,1))
sub.vbt <- vbtsub(vbt, c(2,2,-1,1))

dl.inq <- list(2, c(2,3,4), 5, 1)
inq.advbt <- advbtinq(vbt, dl.inq)
sub.advbt <- advbtsub(vbt, dl.inq)

trav <- trvs(vbt)
inq.travfromidx <- trvsidxinq(trav,c(1,2,3,1))
inq.travfromele <- trvseleinq(trav,"Strain-1150-0.01-0.6")
inq.travfromsub <- trvssubinq(trav, sub.advbt)

ts <- dl2ts(dl)
arr <- dl2arr(dl)

dl.from.chrvec <- chrvec2dl(as.vector(ts))

dl.from.ts <- ts2dl(ts)
dl.from.arr <- arr2dl(arr)

vbt.from.ts <- ts2vbt(ts)
vbt.from.arr <- arr2vbt(arr)

ts.from.vbt <- vbt2ts(vbt)
arr.from.vbt <- vbt2arr(vbt)

travfromsub.data <- datavisit(datatest, sub.advbt)

# compression rate:

test <- list(dl, vbt, arr, ts, trav)
result_vec <- c()

for (i in 1:5) {
  print(object.size(test[[i]]))
  result_vec <- append(result_vec, as.numeric(object.size(test[[i]])))
}

cpr_rate <- (max(result_vec)-min(result_vec))/max(result_vec)
cpr_rate

# Unregularized double list test (simple data cleaning):

unregdl <- list(c("7", 2, 10), c("chr", "5"), c(), c("var2", "var1", "var3"), c("M-8-9", "3-2"), c("6-3", "2-7"))
regdl <- dl2vbt(unregdl)
regdl2 <- dl2vbt(unregdl, FALSE) # not recommended
