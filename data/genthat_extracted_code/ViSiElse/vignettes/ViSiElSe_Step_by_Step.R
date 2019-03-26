## ----fig.show='asis',fig.width=7, fig.height=5,warning=FALSE-------------
coffee <- c(  58, 11, 5, 53, 53, 59, 24, 59, 46, 20)
fill_coffee <- c(162, 57, 103, 154, 165, 132, 74, 107, 104,  93)
fill_water <- c(  66,  92, 54, 78, 74, 114, 91, 129, 71, 56)
push_B <- c( 74, 99, 62, 84, 83, 120, 95, 129, 80, 63 )
drink <- c( 472, 176, 475, 283, 265, 207, 234, 184, 490, 520)
X <- data.frame(id = seq(1,10), coffee, fill_coffee,fill_water,push_B,drink)
head(X)

## ----echo=FALSE, warning=FALSE-------------------------------------------
library(ViSiElse)

## ----fig.show='asis',fig.width=7, fig.height=5, warning=FALSE------------
visi1 <- visielse(X)

## ----fig.show='asis',fig.width=7, fig.height=5, warning=FALSE------------
visi1 <- visielse(X, pixel = 5)

## ----fig.show='asis',fig.width=7, fig.height=5, warning=FALSE------------
visi1 <- visielse(X, pixel = 80)

## ----fig.show='asis',fig.width=6, fig.height=3, warning=FALSE------------
visi1 <- visielse(X,informer = "mean")

## ----fig.show='asis',fig.width=6, fig.height=3, warning=FALSE------------
visi1 <- visielse(X,informer = NULL)

## ----fig.width=7, fig.height=3.5-----------------------------------------
visi1 <- visielse(X,informer = NULL, doplot = FALSE)
book <- visi1@book
plot(book)

## ----fig.show='asis',fig.width=7, fig.height=5, warning=FALSE------------
book

## ----fig.show='asis',fig.width=7, fig.height=5, warning=FALSE------------
book[,2] <- c("Taking the coffee",
"Fill the machine with coffee",
"Fill the tank with water",
"Push the Button",
"Drink the coffee")
book
plot(book)
visi1 <- visielse(X, book=book, is.ViSibook = TRUE,informer = NULL)

## ----fig.show='asis',fig.width=7, fig.height=5, warning=FALSE------------
book[,4]<- c(5,1,2,4,3)
plot(book)
visi1 <- visielse(X, book=book, is.ViSibook = TRUE)

## ----fig.show='asis',fig.width=7, fig.height=5, warning=FALSE------------
visi1 <- visielse( X )
book <- ConvertFromViSibook( visi1@book ) # Convert book into data.frame
add_delay <- c( "delay_coffee_push","Preparation","l","6","coffee","push_B")
book[6,] <- add_delay 
book

## ----fig.show='asis',fig.width=7, fig.height=5, warning=FALSE------------
visi2 <- visielse( X=X , book=book,informer=NULL)

## ----fig.show='asis',fig.width=7, fig.height=5, warning=FALSE------------
book$GZDeb <- c(NA,60,NA,NA,NA,NA)
book$GZFin <- c(NA,120,NA,NA,NA,NA)
visi2 <- visielse( X=X , book=book,informer=NULL)

## ----fig.show='asis',fig.width=7, fig.height=5, warning=FALSE------------
book$GZDeb <- c(NA,NA,NA,NA,NA,NA)
book$GZFin <- c(NA,NA,NA,NA,NA,NA)
book$BZBeforeDeb <- c(NA,0,NA,NA,NA,NA)
book$BZBeforeFin <- c(NA,30,NA,NA,NA,NA)
visi2 <- visielse( X=X , book=book,informer=NULL)

## ----fig.show='asis',fig.width=7, fig.height=5, warning=FALSE------------
book$GZDeb <- c(NA,60,NA,NA,NA,NA)
book$GZFin <- c(NA,120,NA,NA,NA,NA)
book$BZBeforeDeb <- c(NA,0,NA,NA,NA,NA)
book$BZBeforeFin <- c(NA,30,NA,NA,NA,NA)
book$BZAfterDeb <- c(NA,180,NA,NA,NA,NA)
book$BZAfterFin <- c(NA,Inf,NA,NA,NA,NA)
visi2 <- visielse( X=X , book=book,informer=NULL)

## ----fig.show='asis',fig.width=7, fig.height=5, warning=FALSE------------
visi1 <- visielse( X,  doplot = FALSE )
book <- ConvertFromViSibook( visi1@book ) # Convert book into data.frame
add_delay <- c( "delay_coffee_push","Preparation","l","6","coffee","push_B")
book[6,] <- add_delay 
book$BZLong <- c(rep(NA,5),60)
book$BZLtype <- c(rep(NA,5),"time")
visi1 <- visielse( X, book=book , informer = NULL)

## ----fig.show='asis',fig.width=7, fig.height=5, warning=FALSE------------
book$BZLong <- c(rep(NA,5),30)
book$BZLtype <- c(rep(NA,5),"span")
visi1 <- visielse( X, book=book ,informer = NULL)

## ----fig.show='asis',fig.width=7, fig.height=5, warning=FALSE------------
group <- c( "group2","group1","group2","group1","group1","group2","group1","group1","group1","group2")
visi1 <- visielse( X,group=group, book=book ,informer = NULL, method = "cut")

## ----fig.show='asis',fig.width=7, fig.height=5, warning=FALSE------------
group <- c( "group1","group1","group1","group1","group1","group2","group2","group2","group2","group2")
visi1 <- visielse( X,group=group, book=book ,informer = NULL, method = "join")

## ----fig.show='asis',fig.width=7, fig.height=5, warning=FALSE------------
group <- c( "group2","group1","group2","group1","group1","group2","group1","group1","group1","group2")
visi1 <- visielse( X,group=group, book=book ,informer = NULL, method = "within",grwithin = "group1")

