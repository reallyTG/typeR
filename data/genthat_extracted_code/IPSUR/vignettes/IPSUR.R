## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ---- echo=FALSE, eval=FALSE------------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    Chapter: An Introduction to R
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

## ---- echo=TRUE, results=TRUE-----------------------------
getOption("defaultPackages")

## ---- echo=TRUE, results=TRUE-----------------------------
2 + 3       # add
4 # 5 / 6   # multiply and divide
7^8         # 7 to the 8th power

## ---- echo=TRUE, results=TRUE-----------------------------
options(digits = 16)
10/3                 # see more digits
sqrt(2)              # square root
exp(1)               # Euler's constant, e
pi       
options(digits = 7)  # back to default

## ---- echo=TRUE, results=TRUE-----------------------------
x <- 7*41/pi   # don't see the calculated value
x              # take a look

## ---- echo=TRUE, results=TRUE-----------------------------
sqrt(-1)              # isn't defined
sqrt(-1+0i)           # is defined
sqrt(as.complex(-1))  # same thing
(0 + 1i)^2            # should be -1
typeof((0 + 1i)^2)

## ---- echo=TRUE, results=TRUE-----------------------------
x <- c(74, 31, 95, 61, 76, 34, 23, 54, 96)
x

## ---- echo=TRUE, results=TRUE-----------------------------
seq(from = 1, to = 5)
seq(from = 2, by = -0.1, length.out = 4)

## ---- echo=TRUE, results=TRUE-----------------------------
1:5

## ---- echo=TRUE, results=TRUE-----------------------------
x[1]
x[2:4]
x[c(1,3,4,8)]
x[-c(1,3,4,8)]

## ---- echo=TRUE, results=TRUE-----------------------------
LETTERS[1:5]
letters[-(6:24)]

## ---- echo=TRUE, results=TRUE-----------------------------
x <- 1:5
sum(x)
length(x)
min(x)
mean(x)      # sample mean
sd(x)        # sample standard deviation

## ---- echo=TRUE, results=TRUE-----------------------------
intersect

## ---- echo=TRUE, results=TRUE-----------------------------
rev

## ---- echo=TRUE, results=TRUE-----------------------------
methods(rev)

## ---- echo=TRUE, results=TRUE-----------------------------
rev.default

## ---- echo=TRUE, results=TRUE-----------------------------
wilcox.test
methods(wilcox.test)

## ---- echo=TRUE, results=TRUE-----------------------------
exp

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ---- echo=FALSE, eval=FALSE------------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    Chapter: Data Description
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

## ----GlobalOptions----------------------------------------
options(knitr.duplicate.label = 'allow')

## ---- echo=FALSE, include=FALSE---------------------------
# Preliminary code to load before start
# This chapter's package dependencies
library(aplpack)
library(e1071)
library(lattice)
library(qcc)

## The vector `precip` \index{Data sets!precip@\texttt{precip}}

## ---- echo=TRUE, results=TRUE-----------------------------
str(precip)

## ---- echo=TRUE, results=TRUE-----------------------------
precip[1:4]

## The U.S. Geological Survey recorded the lengths (in miles) of several

## ---- echo=TRUE, results=TRUE-----------------------------
str(rivers)

## The vector `discoveries` \index{Data

## ---- echo=TRUE, results=TRUE-----------------------------
str(discoveries)

## ---- echo=TRUE, eval=FALSE-------------------------------
stripchart(precip, xlab="rainfall")
stripchart(rivers, method="jitter", xlab="length")
stripchart(discoveries, method="stack", xlab="number")

## ---- label="stripcharts",echo=FALSE, fig.cap='(ref:cap-stripcharts)'----
par(mfrow = c(3,1)) # 3 plots: 3 rows, 1 column
stripchart(precip, xlab="rainfall", cex.lab = cexlab)
stripchart(rivers, method="jitter", xlab="length", cex.lab = cexlab)
stripchart(discoveries, method="stack", xlab="number", ylim = c(0,3), cex.lab = cexlab)
par(mfrow = c(1,1)) # back to normal

## We are going to take another look at the `precip`

## ---- echo=TRUE, eval=FALSE-------------------------------
hist(precip, main = "")
hist(precip, freq = FALSE, main = "")

## ---- label="histograms", echo=FALSE, fig.cap='(ref:cap-histograms)'----
par(mfrow = c(1,2))
hist(precip, main = "", cex.lab = cexlab)
hist(precip, freq = FALSE, main = "", cex.lab = cexlab)
par(mfrow = c(1,1))

## ---- echo=TRUE, eval=FALSE-------------------------------
hist(precip, breaks = 10)
hist(precip, breaks = 25)
hist(precip, breaks = 50)

## ---- label="histograms-bins", echo=FALSE, fig.cap='(ref:cap-histograms-bins)'----
par(mfrow = c(1,3))
hist(precip, breaks = 10, main = "", cex.lab = cexlab)
hist(precip, breaks = 25, main = "", cex.lab = cexlab)
hist(precip, breaks = 50, main = "", cex.lab = cexlab)
par(mfrow = c(1,1))

## `UKDriverDeaths` \index{Data

## ---- echo=TRUE, results=TRUE-----------------------------
stem.leaf(UKDriverDeaths, depth = FALSE)

## Brockwell and Davis [@Brockwell1991] give the annual measurements

## ---- echo=TRUE, eval=FALSE-------------------------------
plot(LakeHuron)
plot(LakeHuron, type = "p")
plot(LakeHuron, type = "h")

## ---- echo=FALSE, fig.cap='(ref:cap-lakehuron)',fig.height=8----
par(mfrow = c(3,1))
plot(LakeHuron, cex.lab = cexlab)
plot(LakeHuron, type = "p", cex.lab = cexlab)
plot(LakeHuron, type = "h", cex.lab = cexlab)
par(mfrow = c(1,1))

## ---- echo=TRUE, eval=FALSE-------------------------------
# The Old Faithful geyser data
d <- density(faithful$eruptions, bw = "sj")
d
plot(d)
hist(precip, freq = FALSE)
lines(density(precip))

## The `state.abb` \index{Data sets!state.abb@\texttt{state.abb}} vector

## ---- echo=TRUE, results=TRUE-----------------------------
str(state.abb)

## The U.S. Department of Commerce of the U.S. Census Bureau releases all

## ---- echo=TRUE, results=TRUE-----------------------------
str(state.region)
state.region[1:5]

## ---- echo=TRUE, results=TRUE-----------------------------
Tbl <- table(state.division)
Tbl

## ---- echo=TRUE, results=TRUE-----------------------------
Tbl/sum(Tbl)      # relative frequencies

## ---- echo=TRUE, results=TRUE-----------------------------
prop.table(Tbl)   # same thing

## The `state.region` data lists each of the 50 states and the region to

## ---- echo=TRUE, eval=FALSE-------------------------------
barplot(table(state.region), cex.names = 1.20)
barplot(prop.table(table(state.region)), cex.names = 1.20)

## ----label="bar-gr-stateregion",echo=FALSE, fig.cap='(ref:cap-stateregion)'----
par(mfrow = c(2,1)) # 2 plots: 2 rows, 1 column
barplot(table(state.region), cex.names = 1.2)
barplot(prop.table(table(state.region)), cex.names = 1.2)
par(mfrow = c(1,1)) # back to normal

## The `state.division` \index{Data

## ---- eval = FALSE----------------------------------------
pareto.chart(table(state.division), ylab="Frequency")

## ---- echo=FALSE, label="pareto-chart", fig.cap='(ref:cap-pareto)'----
pareto.chart(table(state.division), ylab="Frequency", cex.lab = cexlab)

## ---- label="dotchart", fig.cap='(ref:cap-dotchart)'------
x <- table(state.region)
dotchart(as.vector(x), labels = names(x), cex.lab = cexlab)

## ---- echo=TRUE, results=TRUE-----------------------------
x <- 5:9
y <- (x < 7.3)
y

## ---- echo=TRUE, results=TRUE-----------------------------
!y

## ---- echo=TRUE, results=TRUE-----------------------------
x <- c(3, 7, NA, 4, 7)
y <- c(5, NA, 1, 2, 2)
x + y

## ---- echo=TRUE, results=TRUE-----------------------------
sum(x)
sum(x, na.rm = TRUE)

## ---- echo=TRUE, results=TRUE-----------------------------
is.na(x)
z <- x[!is.na(x)]
sum(z)

## ---- echo=TRUE, results=TRUE-----------------------------
with(faithful, stem.leaf(eruptions))

## We said earlier that the `discoveries` data looked positively skewed;

## ---- echo=TRUE, results=TRUE-----------------------------
e1071::skewness(discoveries)
2*sqrt(6/length(discoveries))

## ---- echo=TRUE, results=TRUE-----------------------------
kurtosis(UKDriverDeaths)
4*sqrt(6/length(UKDriverDeaths))

## ---- echo=TRUE, results=TRUE-----------------------------
stem.leaf(rivers)

## ---- echo=TRUE, results=TRUE-----------------------------
stem.leaf(precip)

## We will look for potential outliers in the `rivers` data.

## ---- echo=TRUE, results=TRUE-----------------------------
boxplot.stats(rivers)$out

## ---- echo=TRUE, results=TRUE-----------------------------
boxplot.stats(rivers, coef = 3)$out

## Suppose we have two vectors `x` and `y` and we want to make a data

## ---------------------------------------------------------
x <- 5:8
y <- letters[3:6]
A <- data.frame(v1 = x, v2 = y)

## ---- echo=TRUE, results=TRUE-----------------------------
A[3, ]
A[ , 1]
A[ , 2]

## ---- echo=TRUE, results=TRUE-----------------------------
names(A)
A['v1']

## ---- eval=FALSE------------------------------------------
require(graphics)
mosaicplot(HairEyeColor)
x <- apply(HairEyeColor, c(1, 2), sum)
x
mosaicplot(x, main = "Relation between hair and eye color")
y <- apply(HairEyeColor, c(1, 3), sum)
y
mosaicplot(y, main = "Relation between hair color and sex")
z <- apply(HairEyeColor, c(2, 3), sum)
z
mosaicplot(z, main = "Relation between eye color and sex")

## ---- echo=TRUE, eval=FALSE-------------------------------
xyplot(Petal.Width ~ Petal.Length, data = iris, group = Species)

## ---- echo=FALSE, fig.cap='(ref:cap-xyplot)'--------------
print(xyplot(Petal.Width ~ Petal.Length, data = iris, group = Species))

## ---- echo=TRUE, eval=FALSE-------------------------------
bwplot(~weight | feed, data = chickwts)

## ---- echo=FALSE, fig.cap='(ref:cap-bwplot)'--------------
print(bwplot(~weight | feed, data = chickwts))

## ---- echo=TRUE, eval=FALSE-------------------------------
histogram(~age | education, data = infert)

## ---- echo=FALSE,fig.cap='(ref:cap-histg)'----------------
print(histogram(~age | education, data = infert))

## ---- echo=TRUE, eval=FALSE-------------------------------
xyplot(Petal.Length ~ Petal.Width | Species, data = iris)

## ---- echo=FALSE,fig.cap='(ref:cap-xyplot-by)'------------
print(xyplot(Petal.Length ~ Petal.Width | Species, data = iris))

## ---- echo=TRUE, eval=FALSE-------------------------------
coplot(conc ~ uptake | Type * Treatment, data = CO2)

## ---- echo=FALSE,fig.cap='(ref:cap-coplot)'---------------
print(coplot(conc ~ uptake | Type * Treatment, data = CO2))

## ---- echo=TRUE, results='hide'---------------------------
library("RcmdrPlugin.IPSUR")
data(RcmdrTestDrive)
attach(RcmdrTestDrive)
names(RcmdrTestDrive)

## Perform a summary of all variables in

## Make a table of the `race` variable. Do this with `Statistics`

## Calculate the average `salary` by the factor `gender`. Do this with

## For this problem we will study the variable `reduction`.

## In this problem we will compare the variables `before` and

## Describe the following data sets just as if you were communicating

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ---- echo=FALSE, eval=FALSE------------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018  G. Jay Kerns
#
#    Chapter: Probability
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

## ---- echo=FALSE, include=FALSE---------------------------
# This chapter's package dependencies
library(diagram)
library(ggplot2)
library(prob)
library(RcmdrPlugin.IPSUR)

## ---- echo=FALSE, label="diagram", fig.cap='(ref:cap-diagram)'----
require(diagram)
par(mex = 0.2, cex = 0.5)
openplotmat(frame.plot=TRUE)
straightarrow(from = c(0.46,0.74), to = c(0.53,0.71), arr.pos = 1)
straightarrow(from = c(0.3,0.65), to = c(0.3,0.51), arr.pos = 1)
textellipse(mid = c(0.74,0.55), box.col = grey(0.95), 
  radx = 0.24, rady = 0.22, 
  lab = c(expression(bold(underline(DETERMINISTIC))), 
          expression(2*H[2]+O[2] %->% H[2]*O), "3 + 4 = 7"), cex = 2 )
textrect(mid = c(0.3, 0.75), radx = 0.15, rady = 0.1, 
  lab = c(expression(bold(Experiments))), cex = 2 )
textellipse(mid = c(0.29,0.25), box.col = grey(0.95), 
  radx = 0.27, rady = 0.22, lab = c(expression(bold(underline(RANDOM))), 
  "toss coin, roll die", "count ants on sidewalk", "measure rainfall" ), 
  cex = 2 )

## Consider the random experiment of dropping a Styrofoam cup onto the

## ---- echo=TRUE-------------------------------------------
S <- data.frame(lands = c("down","up","side"))
S

## ---- echo=TRUE-------------------------------------------
tosscoin(1)

## ---- echo=TRUE-------------------------------------------
tosscoin(3)

## ---- echo=TRUE-------------------------------------------
rolldie(1) 

## ---- echo=TRUE-------------------------------------------
head(cards()) 

## Let our urn simply contain three

## ---- echo=TRUE-------------------------------------------
urnsamples(1:3, size = 2, replace = TRUE, ordered = TRUE)

## ---- echo=TRUE-------------------------------------------
urnsamples(1:3, size = 2, replace = FALSE, ordered = TRUE)

## ---- echo=TRUE-------------------------------------------
urnsamples(1:3, size = 2, replace = FALSE, ordered = FALSE) 

## ---- echo=TRUE-------------------------------------------
urnsamples(1:3, size = 2, replace = TRUE, ordered = FALSE) 

## ---- echo=TRUE-------------------------------------------
S <- tosscoin(2, makespace = TRUE) 
S[1:3, ] 

## ---- echo=TRUE-------------------------------------------
S[c(2,4), ] 

## ---- echo=TRUE, results='hide'---------------------------
S <- cards() 

## ---- echo=TRUE-------------------------------------------
subset(S, suit == "Heart") 

## ---- echo=TRUE-------------------------------------------
subset(S, rank %in% 7:9)

## ---- echo=TRUE-------------------------------------------
subset(rolldie(3), X1+X2+X3 > 16) 

## ---- echo=TRUE-------------------------------------------
x <- 1:10 
y <- 8:12 
y %in% x

## ---- echo=TRUE-------------------------------------------
isin(x,y) 

## ---- echo=TRUE, results='hide'---------------------------
x <- 1:10 
y <- c(3,3,7) 

## ---- echo=TRUE-------------------------------------------
all(y %in% x)
isin(x,y) 

## ---- echo=TRUE-------------------------------------------
isin(x, c(3,4,5), ordered = TRUE) 
isin(x, c(3,5,4), ordered = TRUE) 

## ---- echo=TRUE-------------------------------------------
S <- rolldie(4) 
subset(S, isin(S, c(2,2,6), ordered = TRUE)) 

## ---- echo=TRUE, results='hide'---------------------------
S <- cards() 
A <- subset(S, suit == "Heart") 
B <- subset(S, rank %in% 7:9)

## ---- echo=TRUE-------------------------------------------
union(A,B)

## ---- echo=TRUE-------------------------------------------
intersect(A,B)

## ---- echo=TRUE-------------------------------------------
setdiff(A,B)

## ---- echo=TRUE-------------------------------------------
setdiff(B,A) 

## When the `prob` package [@prob] loads you will notice a message:

## The Equally Likely Model asserts that every outcome of the sample

## ---- echo=TRUE-------------------------------------------
outcomes <- rolldie(1) 
p <- rep(1/6, times = 6) 
probspace(outcomes, probs = p) 

## ---- echo=TRUE-------------------------------------------
probspace(1:6, probs = p) 

## ---- echo=TRUE-------------------------------------------
probspace(1:6) 

## ---- echo=TRUE-------------------------------------------
rolldie(1, makespace = TRUE)

## While the `makespace`

## ---- echo=TRUE-------------------------------------------
probspace(tosscoin(1), probs = c(0.70, 0.30)) 

## \(\mathbb{P}(A)\geq0\) for any event \(A\subset S\).

## \(\mathbb{P}(S)=1\).

## If the events \(A_{1}\), \(A_{2}\),

## Consider the random experiment \(E\) of tossing a coin. Then the

## Suppose the experiment \(E\) consists of tossing a fair coin

## Imagine a three child family, each child

## Consider the experiment of rolling a six-sided die, and let the

## Consider a standard deck of 52 cards. These are usually labeled with

## Staying with the deck of cards, let another random experiment be the

## ---- echo=TRUE, results='hide'---------------------------
S <- cards(makespace = TRUE) 
A <- subset(S, suit == "Heart") 
B <- subset(S, rank %in% 7:9)

## ---- echo=TRUE-------------------------------------------
Prob(A) 

## ---- echo=TRUE-------------------------------------------
Prob(S, suit == "Heart") 

## Suppose that an experiment is composed of two successive

## We would like to order a pizza. It will be sure to have cheese (and

## We would like to buy a desktop computer to study statistics. We go to

## The number of ways in which one may select an ordered sample of \(k\)

## Take a coin and flip it 7 times. How many sequences of Heads and Tails

## In a class of 20 students, we randomly select a class president, a

## We rent five movies to watch over the span of two nights. We wish to

## The number of ways in which one may select an unordered sample of

## You rent five movies to watch over the span of two nights, but only

## Place 3 six-sided dice into a cup. Next, shake the cup well and pour

## We will compute the number of outcomes for each of the four

## ---- echo=TRUE-------------------------------------------
nsamp(n=3, k=2, replace = TRUE, ordered = TRUE) 
nsamp(n=3, k=2, replace = FALSE, ordered = TRUE) 
nsamp(n=3, k=2, replace = FALSE, ordered = FALSE) 
nsamp(n=3, k=2, replace = TRUE, ordered = FALSE) 

## There are 11 artists who each submit a portfolio containing 7

## ---- echo=TRUE, results='hide'---------------------------
n <- c(11,7,31) 
k <- c(3,4,3) 
r <- c(FALSE,FALSE,TRUE) 

## ---- echo=TRUE, results='hide'---------------------------
x <- nsamp(n, k, rep = r, ord = TRUE) 

## ---- echo=TRUE-------------------------------------------
prod(x) 

## ---- echo=TRUE-------------------------------------------
(11*10*9)*(7*6*5*4)*31^3 

## ---- echo=TRUE-------------------------------------------
prod(9:11)*prod(4:7)*31^3 

## ---- echo=TRUE-------------------------------------------
prod(factorial(c(11,7))/factorial(c(8,3)))*31^3 

## Suppose that there are \(n\) people together

## ---- echo=FALSE, label="birthday",fig.cap='(ref:cap-birthday)'----
g <- Vectorize(pbirthday.ipsur)
plot(1:50, g(1:50), xlab = "Number of people in room", ylab = "Prob(at least one match)")
remove(g)

## ---- echo=TRUE, eval=FALSE-------------------------------
library(RcmdrPlugin.IPSUR)
g <- Vectorize(pbirthday.ipsur)
plot(1:50, g(1:50), xlab = "Number of people in room", 
  ylab = "Prob(at least one match)" )
abline(h = 0.5)
abline(v = 23, lty = 2)
remove(g)

## The conditional probability of \(B\) given \(A\), denoted

## Toss a six-sided die twice. The

## ---- echo=FALSE,label="twodiceAB",fig.cap='(ref:cap-twodiceAB)'----
A <- rolldie(2)
B <- subset(A, X1==X2)
C <- subset(A, X1+X2 > 7)
B$lab <- rep("X", dim(B)[1])
C$lab <- rep("O", dim(C)[1])
p <- ggplot(rbind(B, C), aes(x=X1, y=X2, label=lab))
p + geom_text(size = 5) + xlab("First roll") + ylab("Second roll")

## ---- echo=TRUE-------------------------------------------
S <- rolldie(2, makespace = TRUE)  # assumes ELM
head(S)                            #  first few rows

## ---- echo=TRUE, results='hide'---------------------------
A <- subset(S, X1 == X2)
B <- subset(S, X1 + X2 >= 8)

## ---- echo=TRUE-------------------------------------------
Prob(A, given = B)
Prob(B, given = A)

## ---- echo=TRUE-------------------------------------------
Prob(S, X1==X2, given = (X1 + X2 >= 8) )
Prob(S, X1+X2 >= 8, given = (X1==X2) )

## For any fixed event \(A\) with \(\mathbb{P}(A)>0\),

## For any events \(A\), \(B\), and \(C\) with \(\mathbb{P}(A)>0\),

## At the beginning of the section we drew

## ---------------------------------------------------------
L <- cards()
M <- urnsamples(L, size = 2)
N <- probspace(M)
N[[1]][[1]];  N$probs[1]

## ---- echo=TRUE-------------------------------------------
Prob(N, all(rank == "A"))

## Consider an urn with 10 balls inside, 7 of

## ---- echo=TRUE, results='hide'---------------------------
L <- rep(c("red","green"), times = c(7,3))
M <- urnsamples(L, size = 3, replace = FALSE, ordered = TRUE)
N <- probspace(M)

## ---- echo=TRUE-------------------------------------------
Prob(N, isrep(N, "red", 3))

## ---- echo=TRUE-------------------------------------------
Prob(N, isrep(N, "red", 2))

## ---- echo=TRUE-------------------------------------------
Prob(N, isin(N, c("red","green","red"), ordered = TRUE))

## ---- echo=TRUE-------------------------------------------
Prob(N, isin(N, c("red","green","red")))

## Consider two urns, the first with 5 red balls and 3 green balls, and

## We saw the `RcmdrTestDrive` data set in Chapter \@ref(cha-introduction-to-r)

## ---- echo=TRUE-------------------------------------------
library(RcmdrPlugin.IPSUR)
data(RcmdrTestDrive)  
.Table <- xtabs( ~ smoking + gender, data = RcmdrTestDrive)
addmargins(.Table) # Table with marginal distributions

## Events \(A\) and \(B\) are said to be *independent* if

## If the events \(A\) and \(B\) are independent then

## Suppose that \(A\) and \(B\) are independent. We will show the second

## The events \(A\), \(B\), and \(C\) are *mutually independent* if the

## Toss ten coins. What is the probability of

## Toss ten coins. What is the probability of observing at least one

## ---- echo=TRUE-------------------------------------------
S <- tosscoin(10, makespace = TRUE)
A <- subset(S, isrep(S, vals = "T", nrep = 10))
1 - Prob(A)

## (Continued, see Example \@ref(ex:unbalanced-coin)). It was

## ---- echo=TRUE-------------------------------------------
iidspace(c("H","T"), ntrials = 3, probs = c(0.7, 0.3)) 

## Let \(B_{1}\), \(B_{2}\), ..., \(B_{n}\) be mutually exclusive and

## The proof follows from looking at \(\mathbb{P}(B_{k}\cap A)\) in two

## In this problem,

## Suppose the boss gets a change

## Continued from Example \@ref(ex:misfiling-assistants). We store the

## ---- echo=TRUE-------------------------------------------
prior <- c(0.6, 0.3, 0.1)
like <- c(0.003, 0.007, 0.010)
post <- prior # like
post / sum(post)

## Let us incorporate the posterior probability (`post`) information from

## ---- echo=TRUE-------------------------------------------
newprior <- post
post <- newprior * like^7
post / sum(post)

## ---- echo=TRUE-------------------------------------------
fastpost <- prior * like^8
fastpost / sum(fastpost)

## A *random variable* \(X\) is a function \(X:S\to\mathbb{R}\) that

## Let \(E\) be the experiment of flipping a coin twice. We have seen

## Let \(E\) be the experiment of flipping a coin repeatedly until

## Let \(E\) be the experiment of tossing a coin in the air, and define

## ---- echo=TRUE, results='hide'---------------------------
S <- rolldie(3, nsides = 4, makespace = TRUE) 
S <- addrv(S, U = X1-X2+X3) 

## ---- echo=TRUE-------------------------------------------
head(S)

## ---- echo=TRUE-------------------------------------------
Prob(S, U > 6) 

## ---- echo=TRUE-------------------------------------------
S <- addrv(S, FUN = max, invars = c("X1","X2","X3"), name = "V") 
S <- addrv(S, FUN = sum, invars = c("X1","X2","X3"), name = "W") 
head(S) 

## ---- echo=TRUE-------------------------------------------
marginal(S, vars = "V") 

## ---- echo=TRUE-------------------------------------------
marginal(S, vars = c("V", "W")) 

## Prove the assertion given in the text: the

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ---- echo=FALSE, eval=FALSE------------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018  G. Jay Kerns
#
#    Chapter: Discrete Distributions
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

## ---- echo=FALSE, include=FALSE---------------------------
# This chapter's package dependencies
library(distrEx)
distroptions("WarningSim" = FALSE)   
         # switches off warnings as to (In)accuracy due to simulations
distroptions("WarningArith" = FALSE) 
         # switches off warnings as to arithmetics

## Toss a coin 3 times. The sample space would be \[

## We will calculate the mean of \(X\) in Example

## Note that although we say \(X\) is 3.5 on the average, we must keep in

## ---- echo=TRUE, results='hide'---------------------------
x <- c(0,1,2,3)
f <- c(1/8, 3/8, 3/8, 1/8)

## ---- echo=TRUE-------------------------------------------
mu <- sum(x * f)
mu

## ---- echo=TRUE-------------------------------------------
sigma2 <- sum((x-mu)^2 * f)
sigma2

## ---- echo=TRUE-------------------------------------------
sigma <- sqrt(sigma2)
sigma

## ---- echo=TRUE-------------------------------------------
F <- cumsum(f)
F

## ---- echo=TRUE-------------------------------------------
X <- DiscreteDistribution(supp = 0:3, prob = c(1,3,3,1)/8)
E(X); var(X); sd(X)

## Roll a die and  let \(X\) be the upward face showing.  Then \(m = 6\),

## A four-child family. Each child may be either a boy (\(B\)) or a girl

## We can calculate it in R Commander under the `Binomial

## ---------------------------------------------------------
A <- data.frame(Pr=dbinom(0:4, size = 4, prob = 0.5))
rownames(A) <- 0:4 
A

## Roll 12 dice simultaneously, and let \(X\) denote the number of 6's

## ---- echo=TRUE-------------------------------------------
pbinom(9, size=12, prob=1/6) - pbinom(6, size=12, prob=1/6)
diff(pbinom(c(6,9), size = 12, prob = 1/6))  # same thing

## Toss a coin three times and let \(X\) be the

## ---- echo=FALSE,label="binom-cdf-base", fig.cap='(ref:cap-binom-cdf-base)'----
plot(0, xlim = c(-1.2, 4.2), ylim = c(-0.04, 1.04), type = "n", xlab = "number of successes", ylab = "cumulative probability")
abline(h = c(0,1), lty = 2, col = "grey")
lines(stepfun(0:3, pbinom(-1:3, size = 3, prob = 0.5)), verticals = FALSE, do.p = FALSE)
points(0:3, pbinom(0:3, size = 3, prob = 0.5), pch = 16, cex = 1.2)
points(0:3, pbinom(-1:2, size = 3, prob = 0.5), pch = 1, cex = 1.2)

## Another way to do Example \@ref(ex:toss-coin-3-withr) is with the `distr`

## ---- echo=TRUE-------------------------------------------
X <- Binom(size = 3, prob = 1/2)
X

## ---- echo=TRUE-------------------------------------------
d(X)(1)   # pmf of X evaluated at x = 1
p(X)(2)   # cdf of X evaluated at x = 2

## ---- echo=FALSE,label="binom-plot-distr",fig.cap='(ref:cap-binom-plot-distr)'----
X <- Binom(size = 3, prob = 1/2)
plot(X, cex = 0.2)

## More generally, given a function \(g\) we define the *expected value

## For any functions \(g\) and \(h\), any

## Go directly from the definition. For example, \[ \mathbb{E}[c \cdot

## Given a random variable \(X\), its *moment generating function*

## Find the MGF for \(X\sim\mathsf{disunif}(m)\). Since \(f(x) = 1/m\),

## Find the MGF for

## The moment generating function, if it exists in a

## Suppose we encounter a random variable which has MGF

## Let \(X \sim \mathsf{binom}(\mathtt{size} = n,\,\mathtt{prob} = p)\)

## We learned in this section that \(M^{(r)}(0) = \mathbb{E} X^{r}\). We

## ---- echo=TRUE-------------------------------------------
X <- Binom(size = 3, prob = 0.45)
E(X)
E(3*X + 4)

## ---- echo=TRUE-------------------------------------------
var(X)
sd(X)

## The *empirical cumulative distribution function* \(F_{n}\) (written

## ---- echo=TRUE-------------------------------------------
x <- c(4, 7, 9, 11, 12)
ecdf(x)

## ---- label="empirical-cdf",fig.cap='(ref:cap-empirical-cdf)'----
plot(ecdf(x))

## ---- echo=TRUE-------------------------------------------
epdf <- function(x) function(t){sum(x %in% t)/length(x)}
x <- c(0,0,1)
epdf(x)(0)       # should be 2/3

## ---- echo=TRUE-------------------------------------------
x <- c(0,0,1)
sample(x, size = 7, replace = TRUE)

## Suppose in a certain shipment of 250 Pentium processors there are 17

## ---- echo=TRUE-------------------------------------------
dhyper(3, m = 17, n = 233, k = 5)

## ---- echo = TRUE-----------------------------------------
sum(dhyper(0:2, m = 17, n = 233, k = 5))

## ---- echo=TRUE-------------------------------------------
phyper(2, m = 17, n = 233, k = 5)

## ---- echo=TRUE-------------------------------------------
phyper(1, m = 17, n = 233, k = 5, lower.tail = FALSE)

## ---- echo=TRUE-------------------------------------------
x <- rhyper(100000, m = 17, n = 233, k = 5)

## ---- echo=TRUE-------------------------------------------
mean(x)

## ---- echo=TRUE-------------------------------------------
sd(x)

## The Pittsburgh Steelers place kicker, Jeff Reed, made 81.2% of his

## ---- echo=TRUE-------------------------------------------
pgeom(4, prob = 0.812, lower.tail = FALSE)

## Some books use a slightly different definition of the geometric

## We flip a coin repeatedly and let \(X\) count the number of Tails

## ---- echo=TRUE-------------------------------------------
dnbinom(5, size = 7, prob = 0.5)

## A random variable has MGF

## As with the Geometric distribution, some books use a slightly

## If \(X\) counts the number of events in the

## On the average, five cars arrive at a particular car wash every

## ---- echo=TRUE-------------------------------------------
dpois(0, lambda = 5)

## Suppose the car wash above is in operation from 8AM to 6PM, and we let

## ---- echo=TRUE-------------------------------------------
diff(ppois(c(47, 50), lambda = 50))

## Let \(X\sim\mathsf{nbinom}(\mathtt{size}=r,\,\mathtt{prob}=p)\). We

## Let \(X\) be a discrete random variable with PMF \(f_{X}\) supported

## Let \(X\sim\mathsf{binom}(\mathtt{size}=4,\,\mathtt{prob}=1/2)\), and let \(Y=(X-1)^{2}\). Consider the following table:

## If \(X\) is a random variable with \(\mathbb{E} X=\mu\) and \(\mbox{Var}(X)=\sigma^{2}\), then the mean and variance of \(Y=mX+b\) is

## A recent national study showed that approximately 44.7% of college

## For the following situations, decide what the distribution of \(X\)

## Show that \(\mathbb{E}(X - \mu)^{2} =

## If

## Calculate the mean and variance of the

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ---- echo=FALSE, eval=FALSE------------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018  G. Jay Kerns
#
#    Chapter: Continuous Distributions
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

## ---- echo=FALSE, include=FALSE---------------------------
# This chapter's package dependencies
library(actuar)
library(distrEx)
distroptions("WarningSim" = FALSE)   
         # switches off warnings as to (In)accuracy due to simulations
distroptions("WarningArith" = FALSE) 
         # switches off warnings as to arithmetics

## We can say the following about continuous random variables:

## For any continuous CDF \(F_{X}\) the following are true.

## Let the continuous random variable \(X\) have PDF

## We will try one with unbounded support to brush

## Let \(X\) have PDF \(f(x)=3x^{2}\), \(0<x<1\) and find

## ---- echo=TRUE-------------------------------------------
f <- function(x) 3*x^2
integrate(f, lower = 0.14, upper = 0.71)

## Let \(X\) have PDF \(f(x)=3/x^{4}\), \(x>1\). We may integrate the

## ---- echo=TRUE-------------------------------------------
g <- function(x) 3/x^3
integrate(g, lower = 1, upper = Inf)

## Let us redo Example \@ref(ex:cont-pdf3x2) with the `distr` package.

## ---- echo=TRUE-------------------------------------------
f <- function(x) 3*x^2
X <- AbscontDistribution(d = f, low1 = 0, up1 = 1)
p(X)(0.71) - p(X)(0.14)

## ---- echo=TRUE-------------------------------------------
E(X); var(X); 3/80

## Choose a number in \([0,1]\) at random, and let \(X\) be the number

## If \(X\sim\mathsf{norm}(\mathtt{mean}=\mu,\,\mathtt{sd}=\sigma)\) then

## The MGF of

## The same argument above shows that if \(X\) has MGF \(M_{X}(t)\) then

## We saw in Section \@ref(sub-measures-of-spread)

## ---- echo=TRUE-------------------------------------------
pnorm(1:3) - pnorm(-(1:3))

## Let the random experiment consist of a person taking

## Assuming the IQ model of Example

## ---- echo=TRUE-------------------------------------------
g <- function(x) pnorm(x, mean = 100, sd = 15) - 0.99
uniroot(g, interval = c(130, 145))

## ---- echo=FALSE, include=FALSE---------------------------
temp <- round(uniroot(g, interval = c(130, 145))$root, 4)

## The *quantile function*[^contdist-3] of a random variable \(X\) is

## Here are some properties of quantile functions:

## For \(0<\alpha<1\), the symbol \(z_{\alpha}\) denotes the unique

## Back to Example \@ref(ex:iq-quantile-state-problem), we are looking

## ---- echo=TRUE-------------------------------------------
qnorm(0.99, mean = 100, sd = 15)

## Find the values \(z_{0.025}\), \(z_{0.01}\), and \(z_{0.005}\) (these

## ---- echo=TRUE-------------------------------------------
qnorm(c(0.025, 0.01, 0.005), lower.tail = FALSE)

## Let \(X\) have PDF \(f_{X}\) and let

## The formula in Equation \eqref{eq-univ-trans-pdf-long} is nice, but does not

## Let

## Suppose

## If

## In the case that \(g\) is not monotone we cannot apply Proposition

## Suppose \(X\sim\mathsf{unif}(\mathtt{min}=0,\,\mathtt{max}=1)\) and

## Given a continuous random

## We employ the CDF method. First note that the support of \(Y\) is

## The Probability Integral Transform is true for all continuous random

## Let

## ---- echo=TRUE, warning=FALSE----------------------------
X <- Norm(mean = 0, sd = 1)
Y <- 4 - 3*X
Y

## ---- echo=TRUE, warning=FALSE----------------------------
Y <- exp(X)
Y

## ---- echo=TRUE, warning=FALSE----------------------------
W <- sin(exp(X) + 27)
W

## ---- echo=TRUE-------------------------------------------
p(W)(0.5)
W <- sin(exp(X) + 27)
p(W)(0.5)

## At a car wash, two customers arrive per hour on the average. We decide

## ---- label="chisq-dist-vary-df",fig.cap='(ref:cap-chisq-dist-vary-df)'----
curve(dchisq(x, df = 3), from = 0, to = 20, ylab = "y")
ind <- c(4, 5, 10, 15)
for (i in ind) curve(dchisq(x, df = i), 0, 20, add = TRUE)

## Here are some useful things to know about the chi-square distribution.

## Here are some notes about the \(F\) distribution.

## Calculate the first four raw moments for

## ---- echo=TRUE-------------------------------------------
mgamma(1:4, shape = 13, rate = 1)

## ---- label="gamma-mgf", fig.cap='(ref:cap-gamma-mgf)'----
plot(function(x){mgfgamma(x, shape = 13, rate = 1)}, 
     from=-0.1, to=0.1, ylab = "gamma mgf")

## Find the constant \(C\) so that the given function is a valid PDF of a random variable \(X\).

## For the following random experiments, decide what the distribution of

## If \(Z\) is \(\mathsf{norm}(\mathtt{mean} = 0,\,\mathtt{sd} = 1)\), find

## Calculate the variance of

## Prove the memoryless property for

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ---- echo=FALSE, eval=FALSE------------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018  G. Jay Kerns
#
#    Chapter: Multivariate Distributions
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

## ---- echo=FALSE, include=FALSE---------------------------
# This chapter's package dependencies
library(ggplot2)
library(grid)
library(lattice)
library(mvtnorm)
library(prob)

## Roll a fair die twice. Let \(X\) be

## Let the random experiment again be to roll a

## ---- echo=FALSE, label="max-and-sum-two-dice",fig.cap='(ref:cap-max-and-sum-two-dice)'----
A <- rolldie(2, makespace = TRUE)
A <- addrv(A, max, name = "U")
A <- addrv(A, sum, name = "V", invars = c("X1", "X2"))
p1 <- ggplot(A, aes(x=X1, y=X2, label=U))
p1 <- p1 + geom_text(size = 6) + xlab("X1 = First roll") + 
      ylab("X2 = Second roll") + labs(title = "U = max(X1,X2)")
p2 <- ggplot(A, aes(x=X1, y=X2, label=V))
p2 <- p2 + geom_text(size = 6) + xlab("X1 = First roll") + 
      ylab("") + labs(title = "V = X1 + X2")
grid.newpage()
pushViewport(viewport(layout = grid.layout(1, 2)))
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)
print(p1, vp = vplayout(1, 1))
print(p2, vp = vplayout(1, 2))

## ---- echo=FALSE, label="max-sum-two-dice-joint",fig.cap='(ref:cap-max-sum-two-dice-joint)'----
labs <- with(A, paste("(", U, ",", V, ")", sep = ""))
p3 <- ggplot(A, aes(x = X1, y = X2, label = labs))
p3 + geom_text(size = 6) + xlab("First roll") + ylab("Second roll") + 
  labs(title = "Joint distribution of (U,V) pairs")

## Let the joint PDF of \((X,Y)\) be given by \[

## ---- echo=TRUE-------------------------------------------
S <- rolldie(2, makespace = TRUE)
S <- addrv(S, FUN = max, invars = c("X1","X2"), name = "U")
S <- addrv(S, FUN = sum, invars = c("X1","X2"), name = "V")
head(S)

## ---- echo=TRUE-------------------------------------------
UV <- marginal(S, vars = c("U", "V"))
head(UV)

## ---- echo=TRUE-------------------------------------------
xtabs(round(probs,3) ~ U + V, data = UV)

## ---- echo=TRUE-------------------------------------------
marginal(UV, vars = "U")
head(marginal(UV, vars = "V"))

## ---- echo=TRUE-------------------------------------------
temp <- xtabs(probs ~ U + V, data = UV)
rowSums(temp)
colSums(temp)

## The *covariance* of \(X\) and \(Y\) is

## We will compute the covariance for the

## Let us find the covariance of the variables \((X,Y)\) from Example

## ---- echo=TRUE-------------------------------------------
Eu <- sum(S$U*S$probs)
Ev <- sum(S$V*S$probs)
Euv <- sum(S$U*S$V*S$probs)
Euv - Eu * Ev

## Let the joint PMF of \(X\) and \(Y\) be given by

## Suppose the parameter \(\theta\) is the \(\mathbb{P}(\mbox{Heads})\)

## We usually do not restrict ourselves to the observation of only one

## In Example \@ref(ex:toss-two-dice-joint-pmf) we considered the random experiment of

## In Example \@ref(ex:max-sum-two-dice) we considered the same experiment but

## If \(X\) and \(Y\) are independent,

## This is straightforward from the definition.

## If \(X\) and \(Y\) are independent, then

## When \(X\) and \(Y\) are independent then \(\mathbb{E} XY=\mathbb{E}

## Unfortunately, the converse of Corollary

## If \(X\) and \(Y\) are independent,

## If \(X\) and \(Y\) are independent, then the moment generating

## Choose \(u(x)=\mathrm{e}^{x}\) and \(v(y)=\mathrm{e}^{y}\) in

## Let \(X\sim\mathsf{binom}(\mathtt{size}=n_{1},\,\mathtt{prob}=p)\) and

## Let

## Let \(X_{1}\) and \(X_{2}\) be

## We use Proposition \@ref(pro:expectation-properties) to see

## Let \(X\) and \(Y\) have joint PDF

## Suppose \(X\) and \(Y\) are IID

## If \(X\) and \(Y\) are IID (with common marginal distribution \(F\))

## In Remark \@ref(rem-cov0-not-imply-indep) we noted that just because random

## Inspection of the joint PDF shows that if \(\mu_{X}=\mu_{Y}\) and

## If \((X,Y)\sim\mathsf{mvnorm}(\mathtt{mean}=\upmu,\,\mathtt{sigma}=\Sigma)\) then

## The conditional distribution of \(Y|\, X=x\)

## ---- eval=FALSE------------------------------------------
library("emdbook"); library("mvtnorm") # note: the order matters
mu <- c(0,0); sigma <- diag(2)
f <- function(x,y) dmvnorm(c(x,y), mean = mu, sigma = sigma)
curve3d(f(x,y), from=c(-3,-3), to=c(3,3), theta=-30, phi=30)

## ---- echo=TRUE, eval=FALSE-------------------------------
x <- y <- seq(from = -3, to = 3, length.out = 30)
f <- function(x,y) dmvnorm(cbind(x,y), mean = c(0,0), sigma = diag(2))
z <- outer(x, y, FUN = f)
persp(x, y, z, theta = -30, phi = 30, ticktype = "detailed")

## ---- echo=FALSE,label="mvnorm-pdf",fig.cap='(ref:cap-mvnorm-pdf)'----
x <- y <- seq(from = -3, to = 3, length.out = 30)
f <- function(x,y) dmvnorm(cbind(x,y), mean = c(0,0), sigma = diag(2))
z <- outer(x, y, FUN = f)
persp(x, y, z, theta = -30, phi = 30, ticktype = "detailed")

## It is sometimes easier to *postpone* solving for the inverse

## Let

## It may not be obvious, but Equation \eqref{eq-biv-norm-hidden} is the PDF of a

## Let \(X_{1}\), \(X_{2}\), ..., \(X_{n}\) be

## The mean is easy: \[ \mathbb{E}

## If \(\mathbf{X}\) and \(\mathbf{Y}\) are mutually independent random

## Let \(X_{1}\), \(X_{2}\), ... be a sequence of

## If \(\mathbf{X} \sim

## Look at the MGF of \(\mathbf{Y}\):

## During the 2008 U.S. presidential primary,

## Here are some facts about the multinomial distribution.

## ---- echo=TRUE-------------------------------------------
tmp <- t(xsimplex(3, 6))
p <- apply(tmp, MARGIN = 1, FUN = dmultinom, prob = c(36,27,37))
S <- probspace(tmp, probs = p)
ProbTable <- xtabs(probs ~ X1 + X2, data = S)
round(ProbTable, 3)

## ---- eval=FALSE------------------------------------------
library("scatterplot3d")
X <- t(as.matrix(expand.grid(0:6, 0:6)))
X <- X[, colSums(X) <= 6 ]; X <- rbind(X, 6 - colSums(X))
Z <- round(apply(X, 2, function(x) dmultinom(x, prob = 1:3)), 3)
A <- data.frame(x = X[1, ], y = X[2, ], probability = Z)
scatterplot3d(A, type = "h", lwd = 3, box = FALSE)

## ---- echo=TRUE, eval=FALSE-------------------------------
cloud(probs ~ X1 + X2, data = S, type = c("p","h"), lwd = 2, 
            pch = 16, cex = 1.5, screen = list(z = 15, x = -70))

## ---- echo=FALSE, label="multinom-pmf2",fig.cap='(ref:cap-multinom-pmf2)'----
print(cloud(probs ~ X1 + X2, data = S, type = c("p","h"), lwd = 2, 
            pch = 16, cex = 1.5), screen = list(z = 15, x = -70))

## Prove that \(\mbox{Cov}(X,Y)=\mathbb{E}(XY)-(\mathbb{E} X)(\mathbb{E} Y).\)

## Suppose

## Show that when \(X\) and \(Y\) are independent

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ---- echo=FALSE, eval=FALSE------------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018  G. Jay Kerns
#
#    Chapter: Sampling Distributions
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

## If \(X_{1}\), \(X_{2}\), ..., \(X_{n}\) are independent with

## Let \(X_{1}\), \(X_{2}\), ..., \(X_{n}\) be a

## Plug in \(a_{1}=a_{2}=\cdots=a_{n}=1/n\) in Proposition

## Let \(X_{1}\), \(X_{2}\), ..., \(X_{n}\) be a

## Go from the definition:

## Let \(X_{1}\), \(X_{2}\), ..., \(X_{n}\) be a \(SRS(n)\) from a

## The mean and standard deviation of \(\overline{X}\) follow directly

## Let \(X_{1}\), \(X_{2}\), ..., \(X_{n}\) be a

## The proof is beyond the scope of the present book, but the theorem is

## Let \(X_{1}\), \(X_{2}\), ..., \(X_{n}\) be a \(SRS(n)\) from a

## Divide the numerator and denominator by \(\sigma\) and rewrite \[

## ---- label="students-t-dist-vary-df",fig.cap='(ref:cap-students-t-dist-vary-df)'----
curve(dt(x, df = 30), from = -3, to = 3, lwd = 3, ylab = "y")
ind <- c(1, 2, 3, 5, 10)
for (i in ind) curve(dt(x, df = i), -3, 3, add = TRUE)

## Find \(\mathsf{t}{}_{0.01}(\mathtt{df}=23)\) with the quantile

## ---- echo=TRUE-------------------------------------------
qt(0.01, df = 23, lower.tail = FALSE)

## There are a few things to note about the \(\mathtt{t}(\mathtt{df}=r)\)

## Let \(X_{1}\), \(X_{2}\), ..., \(X_{n}\) be

## We suppose that \(X_{1}\), \(X_{2}\), ... , \(X_{n}\) are IID, and we

## Notice that the shape of the underlying population's distribution is

## How large is "sufficiently large"? It is here that the shape of the

## ---- echo=TRUE, eval=FALSE-------------------------------
example(clt.examp)

## ---- echo=TRUE, eval=FALSE-------------------------------
example(illustrateCLT)

## Let \(X_{1}\), \(X_{2}\), ... , \(X_{n_{1}}\) be an \(SRS(n_{1})\)

## We know that \(\overline{X}\) is

## Even if the distribution of one or both of the samples is not normal,

## For the special case of \(\mu_{X}=\mu_{Y}\) we have shown

## Let \(X_{1}\), \(X_{2}\), ..., \(X_{n_{1}}\) be an \(SRS(n_{1})\) from

## We know that \(\hat{p}_{1}\) is approximately normal for \(n_{1}\)

## Let \(X_{1}\), \(X_{2}\), ..., \(X_{n_{1}}\) be an \(SRS(n_{1})\) from

## We know from Theorem \@ref(thm:xbar-ands) that

## For the special case of \(\sigma_{X}=\sigma_{Y}\) we have shown that

## ---- echo=TRUE, results='hide'---------------------------
iqrs <- replicate(100, IQR(rnorm(100)))

## ---- echo=TRUE-------------------------------------------
mean(iqrs)    # close to 1

## ---- echo=TRUE-------------------------------------------
sd(iqrs)

## ---- label="simulated-iqr",fig.cap='(ref:cap-simulated-iqr)'----
hist(iqrs, breaks = 20)

## ---- echo=TRUE, results='hide'---------------------------
mads <- replicate(100, mad(rnorm(100)))

## ---- echo=TRUE-------------------------------------------
mean(mads)    # close to 1.349

## ---- echo=TRUE-------------------------------------------
sd(mads)

## ---- label="simulated-mads",fig.cap='(ref:cap-simulated-mads)'----
hist(mads, breaks = 20)

## ---- echo=FALSE, include=FALSE---------------------------
k <- 1
n <- sample(10:30, size=10, replace = TRUE)
mu <- round(rnorm(10, mean = 20))

## Suppose that we observe a random sample \(X_{1}\), \(X_{2}\), ... ,

## In this exercise we will investigate how the shape of

## Let \(X_{1}\),..., \(X_{25}\) be a random sample from a

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ---- echo=FALSE, eval=FALSE------------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018  G. Jay Kerns
#
#    Chapter: Estimation
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

## ---- echo=FALSE, include=FALSE---------------------------
library(Hmisc)
library(RcmdrPlugin.IPSUR)
library(reshape)
library(stats4)
library(TeachingDemos)

## Imagine there is a small pond in our backyard,

## ---- echo=FALSE, label="capture-recapture",fig.cap='(ref:cap-capture-recapture)'----
heights = rep(0, 16)
for (j in 7:15) heights[j] <- dhyper(3, m = 7, n = j - 7, k = 4)
plot(6:15, heights[6:15], pch = 16, cex = 1.5, xlab = "number of fish in pond", ylab = "Likelihood")
abline(h = 0)
lines(6:15, heights[6:15], type = "h", lwd = 2, lty = 3)
text(9, heights[9]/6, bquote(hat(F)==.(9)), cex = 2, pos = 4)
lines(9, heights[9], type = "h", lwd = 2)
points(9, 0, pch = 4, lwd = 3, cex = 2)

## In the last example we were only concerned with

## ---- echo=FALSE, label="fishing-part-two",fig.cap='(ref:cap-fishing-part-two)'----
curve(x^5*(1-x)^2, 0, 1, xlab = "p", ylab = "L(p)")
curve(x^4*(1-x)^3, 0, 1, add = TRUE)
curve(x^3*(1-x)^4, 0, 1, add = TRUE)

## Strictly speaking we have only shown that the derivative equals zero

## ---- echo=FALSE, label="species-mle",fig.cap='(ref:cap-species-mle)'----
dat <- rbinom(27, size = 1, prob = 0.3)
like <- function(x){
r <- 1
for (k in 1:27){ r <- r*dbinom(dat[k], size = 1, prob = x)}
return(r)
}
curve(like, from = 0, to = 1, xlab = "parameter space", ylab = "Likelihood", lwd = 3, col = "blue")
abline(h = 0, lwd = 1, lty = 3, col = "grey")
mle <- mean(dat)
mleobj <- like(mle)
lines(mle, mleobj, type = "h", lwd = 2, lty = 3, col = "red")
points(mle, 0, pch = 4, lwd = 2, cex = 2, col = "red")
text(mle, mleobj/6, substitute(hat(theta)==a, list(a=round(mle, 4))), cex = 2, pos = 4)

## Given the observed data \(x_{1}\), \(x_{2}\),..., \(x_{n}\), the

## A value \(\theta\) that maximizes \(L\) is called a *maximum

## Some comments about maximum likelihood estimators:

## Let \(s(X_{1},X_{2},\ldots,X_{n})\) be a statistic which estimates

## Let \(X_{1}\), \(X_{2}\), ... , \(X_{n}\) be

## ---- echo=TRUE-------------------------------------------
x <- mtcars$am
L <- function(p,x) prod(dbinom(x, size = 1, prob = p))
optimize(L, interval = c(0,1), x = x, maximum = TRUE)

## ---- echo=FALSE, include=FALSE---------------------------
A <- optimize(L, interval = c(0,1), x = x, maximum = TRUE)
amax <- A$maximum; aobj <- A$objective

## ---- echo=TRUE-------------------------------------------
minuslogL <- function(p,x){
                -sum(dbinom(x, size = 1, prob = p, log = TRUE))
             }
optimize(minuslogL, interval = c(0,1), x = x)

## We will investigate the `weight` variable of the

## ---- echo=TRUE, results='hide'---------------------------
minuslogL <- function(mu, sigma2){
  -sum(dnorm(x, mean = mu, sd = sqrt(sigma2), log = TRUE))
}

## ---- echo=TRUE-------------------------------------------
library(stats4)
x <- PlantGrowth$weight
MaxLikeEst <- mle(minuslogL, start = list(mu = 5, sigma2 = 0.5))
summary(MaxLikeEst)

## ---- echo=TRUE-------------------------------------------
mean(x); var(x)*29/30; sd(x)/sqrt(30)

## The interval

## The interval is also sometimes written more compactly as

## ---- label="ci-examp",fig.cap='(ref:cap-ci-examp)'-------
ci.examp()

## For a fixed confidence coefficient \(1-\alpha\), if \(n\) increases,

## The `PlantGrowth` data frame gives the results of an experiment to

## ---- echo=TRUE-------------------------------------------
with(PlantGrowth, stem.leaf(weight))

## ---- echo=TRUE-------------------------------------------
dim(PlantGrowth)   # sample size is first entry

## ---- echo=TRUE-------------------------------------------
with(PlantGrowth, mean(weight))

## ---- echo=TRUE-------------------------------------------
qnorm(0.975)

## Give some data with \(X_{1}\), \(X_{2}\), ..., \(X_{n}\) an \(SRS(n)\)

## What if \(\sigma\) is unknown? We instead use the interval

## All of the above intervals for \(\mu\) were two-sided, but there are

## Small sample, some data with \(X_{1}\), \(X_{2}\), ..., \(X_{n}\) an

## ---- echo=TRUE-------------------------------------------
temp <- with(PlantGrowth, z.test(weight, stdev = 0.7))
temp

## ---- echo=TRUE, eval=FALSE-------------------------------
plot(temp, "Conf")

## When estimating a single proportion, one-sided intervals are sometimes

## ---- echo=TRUE-------------------------------------------
library(Hmisc)
binconf(x = 7, n = 25, method = "asymptotic")

## ---- echo=TRUE-------------------------------------------
binconf(x = 7, n = 25, method = "wilson")

## ---- echo=FALSE, include=FALSE---------------------------
data(RcmdrTestDrive)

## ---- echo=TRUE-------------------------------------------
tab <- xtabs(~gender, data = RcmdrTestDrive)
prop.test(rbind(tab), conf.level = 0.95, correct = FALSE)

## ---- echo=TRUE, results='hide'---------------------------
A <- as.data.frame(Titanic)
B <- with(A, untable(A, Freq))

## Given a situation, given \(\sigma\), given \(E\), we would like to

## Always round up any decimal values of \(n\), no matter how small the

## For very small populations sometimes the value of \(n\) obtained from

## Let \(X_{1}\), \(X_{2}\), ..., \(X_{n}\) be an

## Find the upper and lower limits for the

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ---- echo=FALSE, eval=FALSE------------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018  G. Jay Kerns
#
#    Chapter: Hypothesis Testing
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

## ---- echo=FALSE, include=FALSE---------------------------
# This chapter's package dependencies
library(TeachingDemos)
library(HH)

## ---- echo=FALSE, include=FALSE---------------------------
# need this for plotting hypothesis tests
# based on work with R. Heiberger in 2009-10

plot.htest <- function (x, hypoth.or.conf = 'Hypoth',...) {
  require(HH)
  if (x$method == "1-sample proportions test with continuity correction" || x$method == "1-sample proportions test without continuity correction"){
    mu <- x$null.value
    obs.mean <- x$estimate
    n <- NA
    std.dev <- abs(obs.mean - mu)/sqrt(x$statistic)
    deg.freedom <- NA
    if(x$alternative == "two.sided"){
      alpha.right <- (1 - attr(x$conf.int, "conf.level"))/2
      Use.alpha.left <- TRUE
      Use.alpha.right <- TRUE
    } else if (x$alternative == "less") {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- TRUE
      Use.alpha.right <- FALSE
    } else {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- FALSE
      Use.alpha.right <- TRUE
    }

  } else if (x$method == "One Sample z-test"){
    mu <- x$null.value
    obs.mean <- x$estimate
    n <- x$parameter[1]
    std.dev <- x$parameter[2]
    deg.freedom <- NA
    if(x$alternative == "two.sided"){
      alpha.right <- (1 - attr(x$conf.int, "conf.level"))/2
      Use.alpha.left <- TRUE
      Use.alpha.right <- TRUE
    } else if (x$alternative == "less") {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- TRUE
      Use.alpha.right <- FALSE
    } else {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- FALSE
      Use.alpha.right <- TRUE
    }
  } else if (x$method == "One Sample t-test" || x$method == "Paired t-test"){
    mu <- x$null.value
    obs.mean <- x$estimate
    n <- x$parameter + 1
    std.dev <- x$estimate/x$statistic*sqrt(n)
    deg.freedom <- x$parameter
    if(x$alternative == "two.sided"){
      alpha.right <- (1 - attr(x$conf.int, "conf.level"))/2
      Use.alpha.left <- TRUE
      Use.alpha.right <- TRUE
    } else if (x$alternative == "less") {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- TRUE
      Use.alpha.right <- FALSE
    } else {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- FALSE
      Use.alpha.right <- TRUE
    }
  } else if (x$method == "Welch Two Sample t-test"){
    mu <- x$null.value
    obs.mean <- -diff(x$estimate)
    n <- x$parameter + 2
    std.dev <- obs.mean/x$statistic*sqrt(n)
    deg.freedom <- x$parameter
    if(x$alternative == "two.sided"){
      alpha.right <- (1 - attr(x$conf.int, "conf.level"))/2
      Use.alpha.left <- TRUE
      Use.alpha.right <- TRUE
    } else if (x$alternative == "less") {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- TRUE
      Use.alpha.right <- FALSE
    } else {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- FALSE
      Use.alpha.right <- TRUE
    }
  } else if (x$method == " Two Sample t-test"){
    mu <- x$null.value
    obs.mean <- -diff(x$estimate)
    n <- x$parameter + 2
    std.dev <- obs.mean/x$statistic*sqrt(n)
    deg.freedom <- x$parameter
    if(x$alternative == "two.sided"){
      alpha.right <- (1 - attr(x$conf.int, "conf.level"))/2
      Use.alpha.left <- TRUE
      Use.alpha.right <- TRUE
    } else if (x$alternative == "less") {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- TRUE
      Use.alpha.right <- FALSE
    } else {
      alpha.right <- 1 - attr(x$conf.int, "conf.level")
      Use.alpha.left <- FALSE
      Use.alpha.right <- TRUE
    }
  }
  return(normal.and.t.dist(
    mu.H0 = mu,
    obs.mean = obs.mean,
    std.dev = std.dev,
    n = n,
    deg.freedom = deg.freedom,
    alpha.right = alpha.right,
    Use.obs.mean = TRUE,
    Use.alpha.left = Use.alpha.left,
    Use.alpha.right = Use.alpha.right,
    hypoth.or.conf = hypoth.or.conf)
  )
}

## The instructor (with a box of cookies in hand) enters a class of

## ---- echo=TRUE-------------------------------------------
dhyper(0, m = 26, n = 26, k = 5)

## We have a machine that makes widgets.

## Every time we make a decision it is possible to be wrong, and there

## Find 1. The null and alternative hypotheses, 2. Check your assumptions,

## Suppose \(p = \mathrm{the\ proportion\ of\

## ---- echo=TRUE-------------------------------------------
-qnorm(0.99)

## ---- echo=TRUE-------------------------------------------
A <- as.data.frame(UCBAdmissions)
head(A)
xtabs(Freq ~ Admit, data = A)

## ---- echo=TRUE-------------------------------------------
phat <- 1755/(1755 + 2771)
(phat - 0.4)/sqrt(0.4 * 0.6/(1755 + 2771)) 

## We are going to do Example \@ref(ex:prop-test-pvalue-a) all over

## ---- echo=TRUE-------------------------------------------
-qnorm(0.95)

## The *p-value*, or *observed significance level*, of a hypothesis test

## Calculate the \(p\)-value for the test in Examples

## ---- echo=TRUE-------------------------------------------
pnorm(-1.680919)

## If we have two populations with proportions \(p_{1}\) and \(p_{2}\)

## ---- echo=TRUE-------------------------------------------
prop.test(1755, 1755 + 2771, p = 0.4, alternative = "less", 
          conf.level = 0.99, correct = FALSE)

## In the above we set `correct = FALSE` to tell the computer

## If \(\sigma\) is unknown but \(n\) is large then we can use the

## In this example we

## ---- echo=TRUE-------------------------------------------
x <- rnorm(37, mean = 2, sd = 3)
z.test(x, mu = 1, sd = 3, conf.level = 0.90)

## ---- echo=TRUE-------------------------------------------
x <- rnorm(13, mean = 2, sd = 3)
t.test(x, mu = 0, conf.level = 0.90, alternative = "greater")

## ---- echo=FALSE, label="ttest-plot",fig.cap='(ref:cap-ttest-plot)', fig.height=5----
plot(t.test(x, mu = 0, conf.level = 0.90, alternative = "greater"))

## Give some data and a hypothesis. BLANK

## ---- echo=TRUE-------------------------------------------
sigma.test(women$height, sigma = 8)

## If the values of \(\sigma_{X}\) and \(\sigma_{Y}\) are known, then we

## Even if the values of \(\sigma_{X}\) and \(\sigma_{Y}\) are not known,

## It is often helpful to construct side-by-side boxplots and other

## WATCH YOUR ASSUMPTIONS.

## ---- echo=TRUE-------------------------------------------
t.test(extra ~ group, data = sleep, paired = TRUE)

## ---- echo=TRUE-------------------------------------------
with(randu, ks.test(x, "punif"))

## ---- echo=TRUE-------------------------------------------
with(women, shapiro.test(height))

## ---- echo=TRUE-------------------------------------------
with(chickwts, by(weight, feed, shapiro.test))

## ---- echo=TRUE, results='hide'---------------------------
temp <- lm(weight ~ feed, data = chickwts)

## ---- echo=TRUE-------------------------------------------
anova(temp)

## ---- label="between-versus-within", fig.cap='(ref:cap-between-versus-within)'----
y1 <- rnorm(300, mean = c(2,8,22))
plot(y1, xlim = c(-1,25), ylim = c(0,0.45) , type = "n")
f <- function(x){dnorm(x, mean = 2)}
curve(f, from = -1, to = 5, add = TRUE, lwd = 2)
f <- function(x){dnorm(x, mean = 8)}
curve(f, from = 5, to = 11, add = TRUE, lwd = 2)
f <- function(x){dnorm(x, mean = 22)}
curve(f, from = 19, to = 25, add = TRUE, lwd = 2)
rug(y1)

## ---- label="some-f-plots-hh", fig.cap='(ref:cap-some-f-plots-hh)'----
old.omd <- par(omd = c(.05,.88, .05,1))
F.setup(df1 = 5, df2 = 30)
F.curve(df1 = 5, df2 = 30, col='blue')
F.observed(3, df1 = 5, df2 = 30)
par(old.omd)

## ---- label="power-examp",fig.cap='(ref:cap-power-examp)', fig.height=7----
power.examp()

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ---- echo=FALSE, eval=FALSE------------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018  G. Jay Kerns
#
#    Chapter: Simple Linear Regression
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

## ---- echo=FALSE, include=FALSE---------------------------
# This chapter's package dependencies
library(HH)
library(lmtest)
library(RcmdrMisc)

## We assume that \(\mu\) is a linear function of \(x\), that is,

## We further assume that \(Y_{i}\) is \(\mu(x_{i})\), a "signal",

## We lastly assume that the errors are IID normal with mean 0 and variance \(\sigma^{2}\):

## We assume both the normality of the errors \(\epsilon\) and the

## ---- echo=FALSE,label="philosophy",fig.cap='(ref:cap-philosophy)'----
plot(c(0,5), c(0,6.5), type = "n", xlab="x", ylab="y")
abline(h = 0, v = 0, col = "gray60")
abline(a = 2.5, b = 0.5, lwd = 2)
x <- 600:3000/600
y <- dnorm(x, mean = 3, sd = 0.5)
lines(y + 1.0, x)
lines(y + 2.5, x + 0.75)
lines(y + 4.0, x + 1.5)
abline(v = c(1, 2.5, 4), lty = 2, col = "grey")
segments(1, 3, 1 + dnorm(0,0,0.5),3, lty = 2, col = "gray")
segments(2.5, 3.75, 2.5 + dnorm(0,0,0.5), 3.75, lty = 2, col = "gray")
segments(4,4.5, 4 + dnorm(0,0,0.5),4.5, lty = 2, col = "gray")

## We will use the data frame \texttt{cars} \index{Data

## ---- echo=TRUE-------------------------------------------
head(cars)

## ----label="carscatter",fig.cap='(ref:cap-carscatter)'----
plot(dist ~ speed, data = cars)

## ---- echo=TRUE, eval=FALSE-------------------------------
plot(dist ~ speed, data = cars)

## The formula for \(b_{1}\) in Equation

## ---- echo=FALSE, include=FALSE---------------------------
tmpcoef <- round(as.numeric(coef(lm(dist ~ speed, cars))), 2)

## ---- echo=TRUE, results='hide'---------------------------
cars.lm <- lm(dist ~ speed, data = cars)

## ---- echo=TRUE-------------------------------------------
coef(cars.lm)

## ----label="carline",fig.cap='(ref:cap-carline)'----------
plot(dist ~ speed, data = cars)
abline(coef(cars.lm))

## Using the regression line for the

## We may use the regression line to obtain

## ---- echo=TRUE-------------------------------------------
cars[5, ]

## ---- echo=TRUE-------------------------------------------
fitted(cars.lm)[1:5]

## ---- echo=TRUE-------------------------------------------
predict(cars.lm, newdata = data.frame(speed = c(6, 8, 21)))

## ---- echo=TRUE-------------------------------------------
residuals(cars.lm)[1:5]

## ---- echo=FALSE, include=FALSE---------------------------
tmpred <- round(as.numeric(predict(cars.lm, newdata = data.frame(speed = 8))), 2)
tmps <- round(summary(cars.lm)$sigma, 2)

## ---- echo=TRUE-------------------------------------------
carsumry <- summary(cars.lm)
carsumry$sigma

## ---- echo=FALSE, include=FALSE---------------------------
A <- matrix(as.numeric(round(carsumry$coef, 3)), nrow = 2)
B <- round(confint(cars.lm), 3)

## ---- echo=TRUE-------------------------------------------
summary(cars.lm)

## ---- echo=TRUE-------------------------------------------
confint(cars.lm)

## We will find confidence and prediction intervals for the stopping

## ---- echo=TRUE, results='hide'---------------------------
new <- data.frame(speed = c(5, 6, 21))

## ---- echo=TRUE-------------------------------------------
predict(cars.lm, newdata = new, interval = "confidence")

## ---- echo=FALSE------------------------------------------
carsCI <- round(predict(cars.lm, newdata = new, interval = "confidence"), 2)

## ---- echo=TRUE-------------------------------------------
predict(cars.lm, newdata = new, interval = "prediction")

## ---- echo=FALSE, include=FALSE---------------------------
carsPI <- round(predict(cars.lm, newdata = new, interval = "prediction"), 2)

## Using the `cars` data,

## ---- echo=TRUE, eval=FALSE-------------------------------
library(HH)
ci.plot(cars.lm)

## ----label="carscipi",fig.cap='(ref:cap-carscipi)'--------
print(ci.plot(cars.lm))

## ---- echo=TRUE-------------------------------------------
summary(cars.lm)

## ---- echo=TRUE-------------------------------------------
anova(cars.lm)

## ---- echo=TRUE-------------------------------------------
carsumry$r.squared

## ---- echo=TRUE-------------------------------------------
sqrt(carsumry$r.squared)

## ---- echo=TRUE-------------------------------------------
anova(cars.lm)

## ---- echo=FALSE, include=FALSE---------------------------
tmpf <- round(as.numeric(carsumry$fstatistic[1]), 2)

## ----label="normal-hist-cars",fig.cap='(ref:cap-normal-hist-cars)'----
hist(residuals(cars.lm))

## ----label="normal-q-q-plot-cars",fig.cap='(ref:cap-normal-q-q-plot-cars)',message=FALSE----
library(RcmdrMisc)
qqPlot(cars.lm)

## ---- echo=TRUE-------------------------------------------
shapiro.test(residuals(cars.lm))

## ----label="std-resids-fitted-cars", fig.cap='(ref:cap-std-resids-fitted-cars)'----
plot(cars.lm, which = 3)

## ---- echo=TRUE-------------------------------------------
library(lmtest)
bptest(cars.lm)

## ---- label="resids-fitted-cars",fig.cap='(ref:cap-resids-fitted-cars)'----
plot(cars.lm, which = 1)

## ---- echo=TRUE-------------------------------------------
dwtest(cars.lm, alternative = "two.sided")

## ---- echo=TRUE-------------------------------------------
sres <- rstandard(cars.lm)
sres[1:5]

## ---- echo=TRUE-------------------------------------------
sres[which(abs(sres) > 2)]

## ---- echo=TRUE-------------------------------------------
sdelres <- rstudent(cars.lm)
sdelres[1:5]

## ---- echo=TRUE-------------------------------------------
t0.005 <- qt(0.005, df = 47, lower.tail = FALSE)
sdelres[which(abs(sdelres) > t0.005)]

## ---- echo=TRUE-------------------------------------------
leverage <- hatvalues(cars.lm)
leverage[which(leverage > 4/50)]

## ---- echo=TRUE-------------------------------------------
dfb <- dfbetas(cars.lm)
head(dfb)

## ---- echo=TRUE-------------------------------------------
dff <- dffits(cars.lm)
dff[1:5]

## ---- echo=TRUE-------------------------------------------
cooksD <- cooks.distance(cars.lm)
cooksD[1:4]

## ----label="cooks-distance-cars",fig.cap='(ref:cap-cooks-distance-cars)'----
plot(cars.lm, which = 4)

## ---- echo=TRUE-------------------------------------------
F0.50 <- qf(0.5, df1 = 2, df2 = 48)
any(cooksD > F0.50)

## ---- echo=TRUE, eval=FALSE-------------------------------
influence.measures(cars.lm)

## ---- echo=TRUE, eval=FALSE-------------------------------
plot(cars.lm)

## ---- label="diagnostic-plots-cars",fig.cap='(ref:cap-diagnostic-plots-cars)'----
par(mfrow = c(2,2))
plot(cars.lm)
par(mfrow = c(1,1))

## ---- echo=TRUE, eval=FALSE-------------------------------
plot(cars.lm, which = 5)          # std'd resids vs lev plot
identify(leverage, sres, n = 4)   # identify 4 points

## Prove the ANOVA equality, Equation \eqref{eq-anovaeq}. *Hint*:

## Solve the following system of equations for

## Show that the formula given in

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ---- echo=FALSE, eval=FALSE------------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    Chapter: Multiple Linear Regression
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

## ---- echo=FALSE, include=FALSE---------------------------
# This chapter's package dependencies
library(scatterplot3d)
library(lattice)

## \index{Data sets!trees@\texttt{trees}} Measurements were made of the

## ---- echo=TRUE-------------------------------------------
head(trees)

## ---- label="splom-trees", fig.cap='(ref:cap-splom-trees)'----
splom(trees)

## ---- label="3D-scatterplot-trees",fig.cap='(ref:cap-3D-scatterplot-trees)'----
s3d <- with(trees, scatterplot3d(Girth, Height, Volume, 
            pch = 16, highlight.3d = TRUE, angle = 60))

## The formula in Equation \eqref{eq-b-formula-matrix} is convenient for

## We have only found a critical value, and have not actually shown that

## ----echo=FALSE-------------------------------------------
fit <- lm(Volume ~ Girth + Height, data = trees)

## ---- echo=TRUE-------------------------------------------
trees.lm <- lm(Volume ~ Girth + Height, data = trees)
trees.lm

## ---- echo=TRUE-------------------------------------------
head(model.matrix(trees.lm))

## If we wanted to predict the average volume of black cherry trees that

## ---- echo=TRUE-------------------------------------------
fitted(trees.lm)[1:5]

## ---- echo=TRUE, results='hide'---------------------------
new <- data.frame(Girth = c(9.1, 11.6, 12.5), 
                  Height = c(69, 74, 87))

## ---- echo=TRUE-------------------------------------------
new

## ---- echo=TRUE-------------------------------------------
predict(trees.lm, newdata = new)

## ---- echo=FALSE, include=FALSE---------------------------
treesFIT <- round(predict(trees.lm, newdata = new), 1)

## ---- echo=TRUE-------------------------------------------
residuals(trees.lm)[1:5]

## ---- echo=TRUE-------------------------------------------
treesumry <- summary(trees.lm)
treesumry$sigma

## ---- echo=TRUE-------------------------------------------
confint(trees.lm)

## ---- echo=FALSE, include=FALSE---------------------------
treesPAR <- round(confint(trees.lm), 1)

## ---- echo=TRUE, results='hide'---------------------------
new <- data.frame(Girth = c(9.1, 11.6, 12.5), 
                  Height = c(69, 74, 87))

## ---- echo=TRUE-------------------------------------------
predict(trees.lm, newdata = new, interval = "confidence")

## ---- echo=FALSE, include=FALSE---------------------------
treesCI <- round(predict(trees.lm, newdata = new, interval = "confidence"), 1)

## ---- echo=TRUE-------------------------------------------
predict(trees.lm, newdata = new, interval = "prediction")

## ---- echo=FALSE, include=FALSE---------------------------
treesPI <- round(predict(trees.lm, newdata = new, interval = "prediction"), 1)

## ---- echo=TRUE-------------------------------------------
treesumry$r.squared

## ---- echo=TRUE-------------------------------------------
treesumry$adj.r.squared

## ---- echo=TRUE-------------------------------------------
treesumry$fstatistic

## ---- echo=TRUE-------------------------------------------
treesumry

## ---- label="scatterplot-volume-girth-trees",fig.cap='(ref:cap-scatterplot-volume-girth-trees)'----
plot(Volume ~ Girth, data = trees)

## We will fit the quadratic model to the `trees` data and display the

## ---- echo=TRUE-------------------------------------------
treesquad.lm <- lm(Volume ~ scale(Girth) + I(scale(Girth)^2), 
                   data = trees)
summary(treesquad.lm)

## ---- label="fitting-the-quadratic",fig.cap='(ref:cap-fitting-the-quadratic)'----
plot(Volume ~ scale(Girth), data = trees)
lines(fitted(treesquad.lm) ~ scale(Girth), data = trees)

## When a model includes a quadratic term for an independent

## ---- echo=TRUE-------------------------------------------
new <- data.frame(Girth = c(9.1, 11.6, 12.5))
predict(treesquad.lm, newdata = new, interval = "prediction")

## We have mentioned on several occasions that it is important to rescale

## ---- echo=TRUE-------------------------------------------
summary(lm(Volume ~ Girth + I(Girth^2), data = trees))

## ---- echo=TRUE-------------------------------------------
trees$Tall <- cut(trees$Height, breaks = c(-Inf, 76, Inf), 
                  labels = c("no","yes"))
trees$Tall[1:5]

## ---- echo=TRUE-------------------------------------------
class(trees$Tall)

## ---- echo=TRUE-------------------------------------------
treesdummy.lm <- lm(Volume ~ Girth + Tall, data = trees)
summary(treesdummy.lm)

## We were somewhat disingenuous when we defined the dummy variable

## In general, if an explanatory variable `foo` is qualitative with \(n\)

## ---- label="dummy-variable-trees", fig.cap='(ref:cap-dummy-variable-trees)'----
treesTall <- split(trees, trees$Tall)
treesTall[["yes"]]$Fit <- predict(treesdummy.lm, treesTall[["yes"]])
treesTall[["no"]]$Fit <- predict(treesdummy.lm, treesTall[["no"]])
plot(Volume ~ Girth, data = trees)
points(Volume ~ Girth, data = treesTall[["yes"]], pch = 1)
points(Volume ~ Girth, data = treesTall[["no"]], pch = 2)
lines(Fit ~ Girth, data = treesTall[["yes"]])
lines(Fit ~ Girth, data = treesTall[["no"]])

## For the `trees` data, let us fit a polynomial regression model and for

## ---- echo=TRUE-------------------------------------------
treesfull.lm <- lm(Volume ~ Girth + I(Girth^2) + Height + 
                   I(Height^2), data = trees)
summary(treesfull.lm)

## ---- echo=TRUE, results='hide'---------------------------
treesreduced.lm <- lm(Volume ~ -1 + Girth + I(Girth^2), data = trees)

## ---- echo=TRUE-------------------------------------------
anova(treesreduced.lm, treesfull.lm)

## ---- echo=TRUE-------------------------------------------
treesreduced2.lm <- lm(Volume ~ Girth + I(Girth^2) + Height, 
                       data = trees)
anova(treesreduced2.lm, treesfull.lm)

## ---- echo=TRUE-------------------------------------------
treesNonlin.lm <- lm(log(Volume) ~ log(Girth) + 
                       log(Height), data = trees)
summary(treesNonlin.lm)

## ---- echo=TRUE-------------------------------------------
exp(confint(treesNonlin.lm))

## ---- echo=TRUE-------------------------------------------
new <- data.frame(Girth = c(9.1, 11.6, 12.5), 
                  Height = c(69, 74, 87))
exp(predict(treesNonlin.lm, newdata = new, 
            interval = "confidence"))

## ---- echo=TRUE-------------------------------------------
# fake data 
set.seed(1) 
x <- seq(from = 0, to = 1000, length.out = 200) 
y <- 1 + 2*(sin((2*pi*x/360) - 3))^2 + rnorm(200, sd = 2)
# plot(x, y)
acc.nls <- nls(y ~ a + b*(sin((2*pi*x/360) - c))^2, 
               start = list(a = 0.9, b = 2.3, c = 2.9))
summary(acc.nls)
#plot(x, fitted(acc.nls))

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ---- echo=FALSE, eval=FALSE------------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018  G. Jay Kerns
#
#    Chapter: Nonparametric Statistics
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

## ---- echo=FALSE, include=FALSE---------------------------
# Preliminary code to load before start
# This chapter's package dependencies
library(mvtnorm)

## ---- echo=FALSE------------------------------------------
set.seed(42)

## ---------------------------------------------------------
z <- rexp(13)
z

## ---------------------------------------------------------
sum(z > 1)

## ---------------------------------------------------------
binom.test(x = 4, n = 13, p = 0.5)

## ---- echo=FALSE------------------------------------------
TMP <- binom.test(x = 4, n = 13, p = 0.5)

## ---------------------------------------------------------
median(z)

## ---------------------------------------------------------
data.frame(lwr = sort(z)[1:5],
           upr = sort(z, decreasing=TRUE)[1:5],
           clevel = 1 - 2*pbinom(5 - 5:1, size = 13, prob = 0.5))

## ---- echo=FALSE------------------------------------------
TMP <- data.frame(lwr = sort(z)[1:5],
           upr = sort(z, decreasing=TRUE)[1:5],
           clevel = 1 - 2*pbinom(5 - (5:1), size = 13, prob = 0.5))
TMP <- round(TMP,3)

## ---- echo=FALSE------------------------------------------
set.seed(42)

## ---------------------------------------------------------
z = rcauchy(15)
z

## ---------------------------------------------------------
wilcox.test(z, mu = 4, conf.int = TRUE)

## ---- echo = FALSE----------------------------------------
TMP <- wilcox.test(z, mu = 4, conf.int = TRUE)

## ---------------------------------------------------------
wilcox.test(rcauchy(3), mu = 4, conf.int = TRUE)

## ---- echo = FALSE----------------------------------------
set.seed(42)

## ---------------------------------------------------------
x <- rexp(15) + 3
y <- rexp(9)

## ---------------------------------------------------------
wilcox.test(x, y, mu = 2, conf.int = TRUE)

## ---- echo = FALSE----------------------------------------
TMP <- wilcox.test(x, y, mu = 2, conf.int = TRUE)

## ---- echo=FALSE------------------------------------------
set.seed(42)

## ---- echo = FALSE----------------------------------------
set.seed(42)

## ---------------------------------------------------------
library(mvtnorm)
mu <- c(1, 0); Sigma <- matrix(c(1,0.9,0.9,1),2,2)
U <- rmvt(n = 15, sigma = Sigma*(3-2)/3, df = 3) 
V <- U + rep(mu, each = 15)
x <- V[,1];  y <- V[,2]

## ---------------------------------------------------------
wilcox.test(x, y, mu = 1, paired = TRUE, conf.int = TRUE)

## ---- echo = FALSE----------------------------------------
TMP <- wilcox.test(x, y, mu = 1, paired = TRUE, conf.int = TRUE)

## ---- echo = FALSE----------------------------------------
set.seed(42)

## ---------------------------------------------------------
x <- rweibull(44, shape = 1) + 1:4
gps <- factor(rep(c("A","B","C","D"), times = 11))
A <- data.frame(response = x, group = gps)

## ---------------------------------------------------------
stripchart(response ~ group, data = A, method = "jitter")

## ---------------------------------------------------------
kruskal.test(response ~ group, data = A)

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ---- echo=FALSE, eval=FALSE------------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018  G. Jay Kerns
#
#    Chapter: Resampling Methods
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

## ---- echo=FALSE, include=FALSE---------------------------
# This chapter's package dependencies
library(boot)
library(coin)

## Due to the special structure of the empirical CDF, to get an IID

## In this

## ---- echo=TRUE, results='hide'---------------------------
srs <- rnorm(25, mean = 3)
resamps <- replicate(1000, sample(srs, 25, TRUE), 
                     simplify = FALSE)
xbarstar <- sapply(resamps, mean, simplify = TRUE)

## ---- label="bootstrap-se-mean", fig.cap='(ref:cap-bootstrap-se-mean)'----
hist(xbarstar, breaks = 40, prob = TRUE)
curve(dnorm(x, 3, 0.2), add = TRUE) # overlay true normal density

## ---- echo=TRUE-------------------------------------------
mean(xbarstar)
mean(srs)
mean(xbarstar) - mean(srs)

## ---- echo=TRUE-------------------------------------------
sd(xbarstar)

## What would happen if we take more resamples? Instead of 1000

## We look at one where we do not know the

## ---- echo=TRUE-------------------------------------------
resamps <- replicate(1000, sample(rivers, 141, TRUE), 
                     simplify = FALSE)
medstar <- sapply(resamps, median, simplify = TRUE)
sd(medstar)

## ---- label="bootstrapping-se-median", fig.cap='(ref:cap-bootstrapping-se-median)'----
hist(medstar, breaks = 40, prob = TRUE)

## ---- echo=TRUE, eval=FALSE-------------------------------
hist(medstar, breaks = 40, prob = TRUE)

## ---- echo=TRUE-------------------------------------------
median(rivers)
mean(medstar)
mean(medstar) - median(rivers)

## It turns out that there are many bootstrap procedures and commands

## ---- echo=TRUE-------------------------------------------
mean_fun <- function(x, indices) mean(x[indices])
library(boot)
boot(data = srs, statistic = mean_fun, R = 1000)

## ---- echo=TRUE-------------------------------------------
median_fun <- function(x, indices) median(x[indices])
boot(data = rivers, statistic = median_fun, R = 1000)

## Some things to keep in mind about the bootstrap:

## We will try the naive

## ---- echo=TRUE-------------------------------------------
btsamps <- replicate(2000, sample(stack.loss, 21, TRUE), 
                     simplify = FALSE)
thetast <- sapply(btsamps, median, simplify = TRUE)
mean(thetast)
median(stack.loss)
quantile(thetast, c(0.025, 0.975))

## Now we will do it the right way with the `boot` function.

## ---- echo=TRUE-------------------------------------------
med_fun <- function(x, ind) median(x[ind])
med_boot <- boot(stack.loss, med_fun, R = 2000)
boot.ci(med_boot, type = c("perc", "norm", "bca"))

## We will use the t-interval method to find the bootstrap CI for the

## We have seen two methods for bootstrapping confidence intervals for a

## In calculating the permutation test *p-value*, the formula is

## ---- echo=TRUE-------------------------------------------
library(coin)
oneway_test(len ~ supp, data = ToothGrowth)

## ---- echo=TRUE-------------------------------------------
t.test(len ~ supp, data = ToothGrowth, alt = "greater", 
       var.equal = TRUE)

## ---------------------------------------------------------
A <- show(oneway_test(len ~ supp, data = ToothGrowth))
B <- t.test(len ~ supp, data = ToothGrowth, alt = "greater", 
            var.equal = TRUE)

## Here are some things about permutation tests to keep in mind.

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ---- echo=FALSE, eval=FALSE------------------------------
##    IPSUR: Introduction to Probability and Statistics Using R
##    Copyright (C) 2018  G. Jay Kerns
#
##    Chapter: Categorical Data Analysis
#
##    This file is part of IPSUR.
#
##    IPSUR is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
#
##    IPSUR is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
#
##    You should have received a copy of the GNU General Public License
##    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

## ----setup, include=FALSE---------------------------------
knitr::opts_chunk$set(echo = TRUE)
set.seed(42)
library(binom)
library(prob)
library(reshape)
library(vcd)

## ---- include = FALSE, message = FALSE--------------------
Dataset = structure(list(School = structure(c(3L, 2L, 1L, 4L, 3L, 2L, 1L, 
4L, 3L, 2L, 1L, 4L), .Label = c("Adequate", "Good", "Most desirable", 
"Undesirable"), class = "factor"), Rating = structure(c(2L, 2L, 
2L, 2L, 1L, 1L, 1L, 1L, 3L, 3L, 3L, 3L), .Label = c("Average", 
"Outstanding", "Poor"), class = "factor"), Frequency = c(21, 
3, 14, 10, 20, 25, 8, 7, 4, 36, 2, 6)), row.names = c(NA, -12L
), .Names = c("School", "Rating", "Frequency"), class = "data.frame")

library(prob)
A = gen2wayTable(pmatrix = matrix(c(1,3,4,2), nrow = 2), 
                 addmargins = FALSE,
                 as.df = TRUE,
                 dmnames = list(gender = c("female","male"),
                                politics = c("dem", "rep")))
B = gen2wayTable(pmatrix = matrix(c(1,3,6,2,4,5), nrow = 2), 
                 addmargins = FALSE,
                 as.df = TRUE,
                 dmnames = list(gender = c("female","male"),
                                politics = c("dem", "ind", "rep")))
C = genIndepTable(prow = 1:2, pcol = 1:3, 
                 addmargins = FALSE,
                 as.df = TRUE,
                 dmnames = list(gender = c("female","male"),
                                politics = c("dem", "ind", "rep")))

## ---------------------------------------------------------
library(binom)
binom.confint(2, 10, methods = "asymptotic")

## ---------------------------------------------------------
binom.confint(2, 10, methods = "wilson")

## ---------------------------------------------------------
binom.confint(2, 10, methods = "ac")

## ---------------------------------------------------------
binom.confint(2, 10, methods = "exact")

## ---------------------------------------------------------
binom.confint(2, 10, methods = "all")

## ---------------------------------------------------------
prop.test(x = 2, n = 10, p = 0.5, correct = FALSE)

## ---- echo=FALSE------------------------------------------
xtabs(Frequency ~ School + Rating, data = Dataset)

## ---------------------------------------------------------
x = matrix(c(1,2,3,4,5,6), nrow = 2,
           dimnames = list(gender = c("female","male"),
                           politics = c("dem","ind","rep")))
x

## ---------------------------------------------------------
head(Dataset)

## ---------------------------------------------------------
x = xtabs(Frequency ~ School + Rating, data = Dataset)
x

## ---------------------------------------------------------
head(A)

## ---------------------------------------------------------
xtabs(~ politics, data = A)
xtabs(~ gender, data = A)
xtabs(~ gender + politics, data = A)

## ---------------------------------------------------------
HairEyeColor

## ---------------------------------------------------------
xtabs(Freq ~ Hair + Eye, data = HairEyeColor)

## ---------------------------------------------------------
xtabs(Freq ~ Hair + Eye, data = HairEyeColor)

## ---------------------------------------------------------
x = xtabs(Freq ~ Sex + Eye, data = HairEyeColor)
barplot(x, legend = TRUE)

## ---------------------------------------------------------
barplot(x, beside = TRUE, legend = TRUE)

## ---------------------------------------------------------
barplot(t(x), beside = TRUE, legend = TRUE)

## ---------------------------------------------------------
library(vcd)
mosaic(x)

## ---------------------------------------------------------
barplot(xtabs(Freq ~ Hair, data = HairEyeColor))

## ---------------------------------------------------------
pie(xtabs(Freq ~ Hair, data = HairEyeColor))

## ---------------------------------------------------------
x = xtabs(Freq ~ Eye, data = HairEyeColor)
addmargins(x)

## ---------------------------------------------------------
prop.table(x)

## ---------------------------------------------------------
y = xtabs(Freq ~ Hair + Eye, data = HairEyeColor)
y

## ---------------------------------------------------------
rowSums(y)
colSums(y)
addmargins(y)
prop.table(y)

## ---------------------------------------------------------
addmargins(y, margin = 2)
prop.table(y, margin = 1)

## ---------------------------------------------------------
addmargins(y, margin = 1)
prop.table(y, margin = 2)

## ---------------------------------------------------------
z = xtabs(Freq ~ Sex + Hair, data = HairEyeColor)
z

## ---------------------------------------------------------
z[c(2,1), ]

## ---------------------------------------------------------
z[ , c(3,1,4,2)]

## ---------------------------------------------------------
z[c(2,1), c(3,1,4,2)]

## ---------------------------------------------------------
z = xtabs(Freq ~ Hair, data = HairEyeColor)
z

## ---- fig.width=10----------------------------------------
par(mfrow = c(1,2))
pie(z[c(2,4,1,3)])
barplot(z[c(2,4,1,3)])
par(mfrow = c(1,1))

## ---------------------------------------------------------
Y = as.data.frame(y)
head(Y)

## ---------------------------------------------------------
library(reshape)
Ydf = untable(Y, Y$Freq)[ , -3]
row.names(Ydf) <- NULL
head(Ydf)

## ---------------------------------------------------------
y = xtabs(Freq ~ Sex + Survived, data = Titanic)
y

## ---------------------------------------------------------
addmargins(y, margin = 2)

## ---------------------------------------------------------
prop.table(y, margin = 1)

## ---------------------------------------------------------
prop.test(y, correct = FALSE)

## ---------------------------------------------------------
LadyTastingTea = matrix(c(4,0,0,4), nrow = 2,
                        dimnames = list(pouredFirst = c("milk","tea"),
                                        guessedFirst = c("milk","tea")))
LadyTastingTea

## ---------------------------------------------------------
fisher.test(LadyTastingTea, alternative = "greater")

## ---------------------------------------------------------
Performance <- matrix(c(794, 86, 150, 570), nrow = 2,
  dimnames = list("1st Survey" = c("Approve", "Disapprove"),
                 "2nd Survey" = c("Approve", "Disapprove")))
Performance

## ---------------------------------------------------------
mcnemar.test(Performance)

## ---------------------------------------------------------
observed = c(160, 20, 10, 10)
probs = c(0.50, 0.25, 0.10, 0.15)

## ---------------------------------------------------------
chisq.test(observed, p = probs)

## ---------------------------------------------------------
x = xtabs(Freq ~ Sex + Eye, data = HairEyeColor)
x

## ---------------------------------------------------------
addmargins(x, margin = 2)
prop.table(x, margin = 1)

## ---------------------------------------------------------
addmargins(x, margin = 1)
prop.table(x, margin = 2)

## ---------------------------------------------------------
chisq.test(x)

## ---------------------------------------------------------
mosaic(x, shade = TRUE)

## ---------------------------------------------------------
assoc(x, shade = TRUE)

## ---------------------------------------------------------
y = xtabs(Freq ~ Hair + Eye, data = HairEyeColor)
addmargins(y, margin = 2)
prop.table(y, margin = 1)

## ---------------------------------------------------------
addmargins(y, margin = 1)
prop.table(y, margin = 2)

## ---------------------------------------------------------
chisq.test(y)

## ---------------------------------------------------------
mosaic(y, shade = TRUE)

## ---------------------------------------------------------
assoc(y, shade = TRUE)

## ---------------------------------------------------------
x = xtabs(Freq ~ Sex + Survived, data = Titanic)
x

## ---------------------------------------------------------
library(vcd)
oddsratio(x, log = FALSE)

## ---------------------------------------------------------
fourfold(x)

## ---------------------------------------------------------
confint(oddsratio(x, log = FALSE), level = 0.95)

## ---------------------------------------------------------
x = xtabs(Freq ~ Sex + Age + Class, data = Titanic)
ftable(x)

## ---------------------------------------------------------
oddsratio(x, log = FALSE)

## ---------------------------------------------------------
library(vcd)
woolf_test(x)

## ---------------------------------------------------------
fourfold(x)

## ---------------------------------------------------------
mantelhaen.test(x)

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ---- echo=TRUE, results=TRUE-----------------------------
sessionInfo()

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## Let \(f\) be a function defined on some open interval that contains

## A function \(f\) is *continuous at a number* \(a\) if

## The *derivative of a function* \(f\) *at a number* \(a\), denoted by

## If \(f\) and \(g\) are both differentiable and \(F=f\circ g\) is the

## A *critical number* of the function \(f\) is a value \(x^{\ast}\) for

## If \(f\) is differentiable and if

## If \(f\) is twice differentiable and if \(x^{\ast}\) is a critical

## Let \(f\) be defined on \([a,b]\), a closed interval of the real

## Suppose \(f\) is continuous on \([a,b]\). Then

## If \(g\) is a differentiable function whose range is the interval

## Suppose \(f\) and \(g\) are differentiable and \(g'(x)\neq0\) near

## Properties of the Gamma Function:

## The inverse of the \(2\times2\) matrix

## The *determinant* of a square matrix \(\mathbf{A}_{\mathrm{n}\times

## The determinant of the \(2\times2\) matrix

## A square matrix \(\mathbf{A}\) is nonsingular if and only if

## ----include=FALSE, cache=FALSE---------------------------
#    IPSUR: Introduction to Probability and Statistics Using R
#    Copyright (C) 2018 G. Jay Kerns
#
#    This file is part of IPSUR.
#
#    IPSUR is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    IPSUR is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with IPSUR.  If not, see <http://www.gnu.org/licenses/>.

# Preliminary code to load before start
# clear everything to start
rm(list = ls(all = TRUE))

# initial customizations
seed <- 42
set.seed(seed)
options(width = 60)
cexlab <- 1.5

# global knitr configuration
library(knitr)
opts_chunk$set(comment=NA)
opts_knit$set(width = 60)

## *WARNING* This file is not for the faint of heart, dear reader,

## I will skip ahead, dear reader, for much occurred during this

