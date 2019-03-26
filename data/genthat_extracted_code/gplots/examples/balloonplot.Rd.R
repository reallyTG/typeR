library(gplots)


### Name: balloonplot
### Title: Plot a graphical matrix where each cell contains a dot whose
###   size reflects the relative magnitude of the corresponding component.
### Aliases: balloonplot balloonplot.default balloonplot.table
### Keywords: dplot hplot

### ** Examples

## Don't show: 
set.seed(12425421)
## End(Don't show)

# Create an Example Data Frame Containing Car x Color data
carnames <- c("bmw","renault","mercedes","seat")
carcolors <- c("red","white","silver","green")
datavals <- round(rnorm(16, mean=100, sd=60),1)
data <- data.frame(Car=rep(carnames,4),
                   Color=rep(carcolors, c(4,4,4,4) ),
                   Value=datavals )
# show the data
data

# generate balloon plot with default scaling
balloonplot( data$Car, data$Color, data$Value)


# show margin label rotation & space expansion, using some long labels
levels(data$Car) <- c("BMW: High End, German","Renault: Medium End, French",
 "Mercedes: High End, German", "Seat: Imaginary, Unknown Producer")

# generate balloon plot with default scaling
balloonplot( data$Car, data$Color, data$Value, colmar=3, colsrt=90)

# Create an example using table
xnames <- sample( letters[1:3], 50, replace=2)
ynames <- sample( 1:5, 50, replace=2)

tab <- table(xnames, ynames)

balloonplot(tab)

# Example of multiple classification variabls using the Titanic data
library(datasets)
data(Titanic)

dframe <- as.data.frame(Titanic) # convert to 1 entry per row format
attach(dframe)
balloonplot(x=Class, y=list(Survived, Age, Sex), z=Freq, sort=TRUE)

# colorize: surviors lightblue, non-survivors: grey
Colors <- Titanic
Colors[,,,"Yes"] <- "skyblue"
Colors[,,,"No"] <- "grey"
colors <- as.character(as.data.frame(Colors)$Freq)

balloonplot(x=list(Age,Sex),
            y=list(Class=Class,
                   Survived=gdata::reorder.factor(Survived,new.order=c(2,1))
                   ),
            z=Freq,
            zlab="Number of Passengers",
            sort=TRUE,
            dotcol = colors,
            show.zeros=TRUE,
            show.margins=TRUE)





