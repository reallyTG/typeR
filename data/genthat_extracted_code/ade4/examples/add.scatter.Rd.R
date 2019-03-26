library(ade4)


### Name: add.scatter
### Title: Add graphics to an existing plot
### Aliases: add.scatter add.scatter.eig
### Keywords: multivariate hplot

### ** Examples

  data(microsatt)
  w <- dudi.coa(data.frame(t(microsatt$tab)), scann = FALSE, nf = 3)
    
  if(adegraphicsLoaded()) {
    a1 <- rnorm(100)
    b1 <- s1d.barchart(sort(a1), p1d.horizontal = FALSE, plot = FALSE)
    h1 <- s1d.hist(a1, pgrid.draw = FALSE, porigin.draw = FALSE, pbackground.col = "grey", 
      plot = FALSE, ppoly.col = "white", ppoly.alpha = 1)
    g1 <- insert(h1, b1, posi = "topleft", plot = FALSE)
  
    a2 <- rnorm(100)
    b2 <- s1d.barchart(sort(a2), p1d.horizontal = FALSE, plot = FALSE)
    h2 <- s1d.hist(a2, pgrid.draw = FALSE, porigin.draw = FALSE, pbackground.col = "grey", 
      plot = FALSE, ppoly.col = "white", ppoly.alpha = 1)
    g2 <- insert(h2, b2, posi = "topleft", inset = c(0.25, 0.01), plot = FALSE)
  
    a3 <- rnorm(100)
    b3 <- s1d.barchart(sort(a3), p1d.horizontal = FALSE, plot = FALSE)
    h3 <- s1d.hist(a3, pgrid.draw = FALSE, porigin.draw = FALSE, pbackground.col = "grey", 
      plot = FALSE, ppoly.col = "white", ppoly.alpha = 1)
    g3 <- insert(h3, b3, posi = "bottomleft", inset = 0.4, ratio = 0.2, plot = FALSE)
  
    a4 <- rnorm(100)
    b4 <- s1d.barchart(sort(a4), p1d.horizontal = FALSE, plot = FALSE)
    h4 <- s1d.hist(a4, pgrid.draw = FALSE, porigin.draw = FALSE, pbackground.col = "grey", 
      plot = FALSE, ppoly.col = "white", ppoly.alpha = 1)
    g4 <- insert(h3, b3, posi = "bottomright", ratio = 0.3, plot = FALSE)
    
    G1 <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2), plot = TRUE)
    
    g5 <- s.label(w$co, plot = FALSE)
    g6 <- plotEig(w$eig, w$nf, psub = list(text = "Eigenvalues"), 
      pbackground = list(box = TRUE), plot = FALSE)
    G2 <- insert(g6, g5, posi = "bottomright", ratio = 0.25)

  } else {
    par(mfrow=c(2,2))
    f1 <- function(a){
      opar=par("mar","xaxt","yaxt","plt")
      on.exit(par(opar))
      par(mar=rep(.1,4),xaxt="n",yaxt="n",plt=par("plt"))
    
      hist(a,xlab="",ylab="",main="",col="white",proba=TRUE)
      lines(seq(-4,4,le=50),dnorm(seq(-4,4,le=50)),col="red")
    }
    
    a <- rnorm(100)
    barplot(sort(a))
    add.scatter(f1(a),posi="topleft",bg.col="grey")
    
    a <- rnorm(100)
    barplot(sort(a))
    add.scatter(f1(a),posi="topleft",bg.col="grey",inset=c(.25,.01))
    
    a <- rnorm(100)
    barplot(sort(a))
    add.scatter(f1(a),posi="topleft",bg.col="grey",inset=.25,ratio=.1)
    
    a <- rnorm(100)
    barplot(sort(a))
    add.scatter(f1(a),posi="bottomright",bg.col="grey",ratio=.3)
    par(mfrow=c(1,1))
    
    s.label(w$co)
    add.scatter.eig(w$eig,w$nf,posi="bottomright",1,2)
  }



