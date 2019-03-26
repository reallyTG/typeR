library(ViSiElse)


### Name: visielse
### Title: Function 'visielse'
### Aliases: visielse

### ** Examples

coffee <- c(  58, 11,  5, 53, 53, 59, 24, 59, 46, 20)
fill_coffee <- c(162,  57,103,154,165,132,  74, 107, 104,  93)
fill_water <- c(  66,  92,54, 78, 74, 114, 91, 129, 71, 56)
push_B <- c( 74, 99, 62, 84, 83, 120, 95, 129, 80, 63 )
drink <- c( 472, 176, 475, 283, 265, 207, 234, 184, 490, 520)
X <- data.frame(id = seq(1,10), coffee, fill_coffee,fill_water,push_B,drink)
library(ViSiElse)
visi1 <- visielse(X)

#### Changing the pixel of time

visi1 <- visielse(X, pixel = 10)
# Plot the mean and standart deviation

visi1 <- visielse(X,informer = "mean")

#### Do not plot indicators
visi1 <- visielse(X,informer = NULL)


# Extraction of the visibook from the data

visi1 <- visielse(X,informer = NULL, doplot = FALSE)
book <- visi1@book
plot(book)

#### Changing labels

book[,2]<- c("Taking the coffee",
             "Fill the machine with coffee",
             "Fill the tank with water",
             "Push the Button",
             "Drink the coffee")
plot(book)
visi1 <- visielse(X, book=book, is.ViSibook = TRUE,informer = NULL)


#### Change the order of Actions in the process

book[,4]<- c(5,1,2,4,3)
plot(book)
visi1 <- visielse(X, book=book, is.ViSibook = TRUE)



#### Adding a long Actions

visi1 <- visielse( X )
book <- ConvertFromViSibook( visi1@book ) # Convert book into data.frame
add_delay <- c( "delay_coffee_push","Preparation","l","6","coffee","push_B")
book[6,] <- add_delay
book


### ViSiElse representation of long actions

visi2 <- visielse( X=X , book=book,informer=NULL)

## Green & Black zones

book$GZDeb <- c(NA,60,NA,NA,NA,NA)
book$GZFin <- c(NA,120,NA,NA,NA,NA)
book$BZBeforeDeb <- c(NA,0,NA,NA,NA,NA)
book$BZBeforeFin <- c(NA,30,NA,NA,NA,NA)
book$BZAfterDeb <- c(NA,180,NA,NA,NA,NA)
book$BZAfterFin <- c(NA,Inf,NA,NA,NA,NA)
book$BZLong <- c(rep(NA,5),150)
book$BZLtype <- c(rep(NA,5),"time")
visi1 <- visielse( X, book=book , informer = NULL)

book$BZLtype <- c(rep(NA,5),"span")
visi1 <- visielse( X, book=book ,informer = NULL)


## Group

### Method : Cut
group <- c( "group2","group1","group2","group1","group1",
             "group2","group1","group1","group1","group2")
visi1 <- visielse( X,group=group, book=book ,informer = NULL, method = "cut")

visi1 <- visielse( X,group=group, book=book ,informer = NULL, method = "join")

visi1 <- visielse( X,group=group, book=book ,informer = NULL, method = "within",grwithin = "group1")



