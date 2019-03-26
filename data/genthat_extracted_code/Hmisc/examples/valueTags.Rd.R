library(Hmisc)


### Name: valueTags
### Title: Store Discriptive Information About an Object
### Aliases: valueTags valueTags<- valueLabel valueLabel<- valueUnit
###   valueUnit<- valueName valueName<-
### Keywords: attribute misc utilities

### ** Examples

age <- c(21,65,43)
y   <- 1:3
valueLabel(age) <- "Age in Years"
plot(age, y, xlab=valueLabel(age))


x1 <- 1:10
x2 <- 10:1
valueLabel(x2) <- 'Label for x2'
valueUnit(x2) <- 'mmHg'
x2
x2[1:5]
dframe <- data.frame(x1, x2)
Label(dframe)


##In these examples of llist, note that labels are printed after
##variable names, because of print.labelled
a <- 1:3
b <- 4:6
valueLabel(b) <- 'B Label'



