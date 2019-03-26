library(muStat)


### Name: prentice.test
### Title: Prentice (Friedman/Wilcoxon/Kruskal) Rank Sum Test
### Aliases: prentice.test mu.friedman.test mu.kruskal.test mu.wilcox.test
### Keywords: htest multivariate nonparametric

### ** Examples


# friedman.test examples

  treatments <- factor(rep(c("Trt1", "Trt2", "Trt3"), each=4))
  people <- factor(rep(c("Subj1", "Subj2", "Subj3", "Subj4"), 3))
  y <- c(0.73,0.76,0.46,0.85,0.48,0.78,0.87,0.22,0.51,0.03,0.39,0.44)
  print(   friedman.test(y, treatments, people))
  print(mu.friedman.test(y, treatments, people))

  # Now suppose the data is in the form of a matrix, 
  #   rows are people and columns are treatments.
  # Generate 'ymat' and the factor objects: 

  ymat <- matrix(c(0.73,0.76,0.46,0.85,0.48,0.78,0.87,0.22,0.51,
        0.03,0.39,0.44), ncol=3)
  bl <- factor(as.vector(row(ymat)))
  gr <- factor(as.vector(col(ymat)))   
  print(   friedman.test(ymat, gr, bl))  # same answer as above 
  print(mu.friedman.test(ymat, gr, bl))

# kruskal.test examples

  # Data from Hollander and Wolfe (1973), p. 116 
  holl.y <- c(2.9,3.0,2.5,2.6,3.2,3.8,2.7,4.0,2.4,2.8,3.4,3.7,2.2,2.0)
  holl.grps <- factor(c(1,1,1,1,1,2,2,2,2,3,3,3,3,3), 
      labels=c("Normal Subjects","Obstr. Airway Disease","Asbestosis"))
  print(   kruskal.test(holl.y, holl.grps))
  print(mu.kruskal.test(holl.y, holl.grps))
      
  # Now suppose the data is in the form of a table already,  
  # with groups in columns; note this implies that group 
  # sizes are the same. 

  tab.data <- matrix(c(.38,.58,.15,.72,.09,.66,.52,.02,.59,.94,
        .24,.94,.08,.97,.47,.92,.59,.77), ncol=3)
  tab.data

  y2 <- as.vector(tab.data) 
  gr <- factor(as.vector(col(tab.data)))   # Groups are columns 
  print(   kruskal.test(y2, gr))
  print(mu.kruskal.test(y2, gr))

# wilcox.test examples
  
  x <- c(8.2, 9.4, 9.6, 9.7, 10.0, 14.5, 15.2, 16.1, 17.6, 21.5)
  y <- c(4.2, 5.2, 5.8, 6.4, 7.0, 7.3, 10.1, 11.2, 11.3, 11.5)
  print(   wilcox.test(x,y))
  print(mu.wilcox.test(x,y))
  print(   wilcox.test(x,y, exact=FALSE))
  print(mu.wilcox.test(x,y, exact=FALSE))
  print(   wilcox.test(x,y, exact=FALSE, correct=FALSE))
  print(mu.wilcox.test(x,y, exact=FALSE, correct=FALSE))
  xy <- c(x,y)
  groups <- c(rep(1,length(x)),rep(2,length(y)))
  print(prentice.test(xy,groups,exact=FALSE, correct=FALSE))

# compare speed

  if (is.R()) sys.time <- function (...) system.time(...)
  
  n <- 1000
  data <- runif(30*n)
  grps <- c(rep(1,10*n),rep(2,8*n),rep(3,12*n))

  print(sys.time(    kruskal.test( data,grps)              ))
  print(sys.time( mu.kruskal.test( data,grps,optim=FALSE)  ))
  print(sys.time(    prentice.test(data,grps)              ))

  data <- runif(600)
  grps <- rep(1:6,each=100)
  blks <- rep(1:100,length.out=length(data))

  print(sys.time(    friedman.test(data,grps,blks)             ))
  print(sys.time( mu.friedman.test(data,grps,blks,optim=FALSE) ))
  print(sys.time(    prentice.test(data,grps,blks)             ))

  data <- runif(50000)
  grps <- rep(1:2,each=25000)
  Wx <- data[grps==1]
  Wy <- data[grps==2]

  print(sys.time(    wilcox.test(Wx,Wy)                    ))
  print(sys.time( mu.wilcox.test(Wx,Wy,optim=FALSE)        ))
  print(sys.time(    prentice.test(data,grps)              ))



