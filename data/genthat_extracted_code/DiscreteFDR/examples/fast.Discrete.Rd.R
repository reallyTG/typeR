library(DiscreteFDR)


### Name: fast.Discrete
### Title: Fast application of discrete procedures
### Aliases: fast.Discrete

### ** Examples


X1 <- c(4, 2, 2, 14, 6, 9, 4, 0, 1)
X2 <- c(0, 0, 1, 3, 2, 1, 2, 2, 2)
N1 <- rep(148, 9)
N2 <- rep(132, 9)
Y1 <- N1 - X1
Y2 <- N2 - X2
df <- data.frame(X1, Y1, X2, Y2)
df

DBH.su <- fast.Discrete(counts = df, input = "noassoc", direction = "su")
DBH.sd <- fast.Discrete(counts = df, input = "noassoc", direction = "sd")
DBH.sd$Adjusted
ADBH.su <- fast.Discrete(counts = df, input = "noassoc", direction = "su", adaptive = TRUE)
ADBH.sd <- fast.Discrete(counts = df, input = "noassoc", direction = "sd", adaptive = TRUE)
ADBH.sd$Adjusted




