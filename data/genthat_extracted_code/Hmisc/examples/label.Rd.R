library(Hmisc)


### Name: label
### Title: Label Attribute of an Object
### Aliases: label label<- label.default label.Surv label<-.default
###   labelPlotmath labelLatex [.labelled print.labelled Label
###   Label.data.frame llist prList putHfig plotmathTranslate
###   as.data.frame.labelled data.frame.labelled reLabelled
###   label.data.frame label<-.data.frame relevel.labelled combineLabels
### Keywords: attribute misc utilities

### ** Examples

age <- c(21,65,43)
y   <- 1:3
label(age) <- "Age in Years"
plot(age, y, xlab=label(age))

data <- data.frame(age=age, y=y)
label(data)

label(data, self=TRUE) <- "A data frame"
label(data, self=TRUE)

x1 <- 1:10
x2 <- 10:1
label(x2) <- 'Label for x2'
units(x2) <- 'mmHg'
x2
x2[1:5]
dframe <- data.frame(x1, x2)
Label(dframe)

labelLatex(x2, hfill=TRUE, bold=TRUE)
labelLatex(label='Velocity', units='m/s')

##In these examples of llist, note that labels are printed after
##variable names, because of print.labelled
a <- 1:3
b <- 4:6
label(b) <- 'B Label'
llist(a,b)
llist(a,b,d=0)
llist(a,b,0)


w <- llist(a, b>5, d=101:103)
sapply(w, function(x){
  hist(as.numeric(x), xlab=label(x))
  # locator(1)   ## wait for mouse click
})

# Or: for(u in w) {hist(u); title(label(u))}



