library(analogue)


### Name: Stratiplot
### Title: Palaeoecological stratigraphic diagrams
### Aliases: Stratiplot Stratiplot.default Stratiplot.formula
###   Stratiplot.matrix
### Keywords: hplot

### ** Examples

data(V12.122)
Depths <- as.numeric(rownames(V12.122))

(plt <- Stratiplot(Depths ~ O.univ + G.ruber + G.tenel + G.pacR,
                   data = V12.122,  type = c("h","l","g","smooth")))

## Order taxa by WA in depth --- ephasises change over time
(plt <- Stratiplot(Depths ~ O.univ + G.ruber + G.tenel + G.pacR,
                   data = V12.122, type = c("h"), sort = "wa"))

## Using the default interface
spp.want <- c("O.univ","G.ruber","G.tenel","G.pacR")
(plt <- Stratiplot(V12.122[, spp.want], y = Depths,
                   type = c("poly", "g")))

## Adding zones to a Stratigraphic plot
## Default labelling and draw zone legend
## Here we choose 4 arbitrary Depths as the zone boundaries
set.seed(123)
Zones <-sample(Depths, 4)
Stratiplot(Depths ~ O.univ + G.ruber + G.tenel + G.pacR,
           data = V12.122, type = c("poly","g"),
           zones = Zones)

## As before, but supplying your own zone labels
zone.labs <- c("A","B","C","D","E")
Stratiplot(Depths ~ O.univ + G.ruber + G.tenel + G.pacR,
           data = V12.122, type = c("poly","g"),
           zones = Zones, zoneNames = zone.labs)

## Suppress the drawing of the zone legend
Stratiplot(Depths ~ O.univ + G.ruber + G.tenel + G.pacR,
           data = V12.122, type = c("poly","g"),
           zones = Zones, drawLegend = FALSE)

## Add zones and draw a legend, but do not label the zones
Stratiplot(Depths ~ O.univ + G.ruber + G.tenel + G.pacR,
           data = V12.122, type = c("poly","g"),
           zones = Zones, zoneNames = "")

## Show illustration of NA handling
set.seed(42)
dat <- data.frame(Depth = 1:20, LOI = runif(20), TC = NA)
dat <- within(dat, TC[sample(20, 10)] <- runif(10))
## default is 'na.action = "na.pass"'
Stratiplot(Depth ~ LOI + TC, data = dat, type = c("l","p"))
## to remove rows with NA, use 'na.action = "na.omit"'
Stratiplot(Depth ~ LOI + TC, data = dat, type = c("l","p"),
           na.action = "na.omit")

## Example of two proxies measured on different levels of core
## (Here measurements on alternate levels)
set.seed(5)
dat2a <- data.frame(Depth = seq(1, by = 2, length = 20), LOI = runif(20))
dat2b <- data.frame(Depth = seq(0, by = 2, length = 20), TC = runif(20))
dat2 <- join(dat2a, dat2b, na.replace = FALSE, split = FALSE)
dat2 <- dat2[order(dat2$Depth), ]
head(dat2)

## Default is to allow NA through formula, but drop them when plotting
Stratiplot(Depth ~ LOI + TC, data = dat2, type = c("l","p"))

## compare with this if we didn't suppress NA in default Stratiplot
## method (can't use formula interface for this yet
Stratiplot(dat2[,-1], dat2[,1], type = c("l","p"),
           na.action = "na.pass")
## Notice no lines are draw as there a no "sections" ithout missing
## levels. If you want/desire this behaviour then you can't use formula
## interface yet as there is no way to specify the na.action separately

## Works with matrices
M <- as.matrix(V12.122)
Stratiplot(M, Depths, type = c("h"))

## Custom variable labels using expressions
df <- data.frame(Age = 1:10, Var1 = rnorm(10), Var2 = rnorm(10),
                 Var3 = rnorm(10))
## Use a vector of expressions to label variables on plot
## See ?plotmath for syntax of expressions
exprs <- expression(delta^{15}*N,       # label for Var1
                    delta^{18}*O,       # label for Var2
                    delta^{13}*C)       # label for Var3
Stratiplot(Age ~ ., data = df, labelValues = exprs, varTypes = "absolute")



