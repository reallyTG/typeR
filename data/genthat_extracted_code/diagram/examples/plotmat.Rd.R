library(diagram)


### Name: plotmat
### Title: plots a graph (network), based on a transition matrix
### Aliases: plotmat
### Keywords: aplot

### ** Examples

M <- matrix(nrow = 4, ncol = 4, byrow = TRUE, data = 0)
pp <- plotmat(M, pos = c(1, 2, 1), name = c("A", "B", "C", "D"),
              lwd = 1, box.lwd = 2, cex.txt = 0.8, 
              box.size = 0.1, box.type = "square", box.prop = 0.5,
              main = "plotmat")
pp

# when explicitly given, pos should should be inbetween 0, 1
pos <- cbind (c(0.2, 0.4, 0.6, 0.8), c(0.8, 0.6, 0.4, 0.2))

pp <- plotmat(M, pos = pos, name = c("A", "B", "C", "D"),
              lwd = 1, box.lwd = 2, cex.txt = 0.8, 
              box.size = 0.1, box.type = "square", box.prop = 0.5,
              main = "plotmat")

              
# includes arrows between boxes
pm <- par(mfrow = c(2, 2))
M  <- matrix(nrow = 4, ncol = 4, byrow = TRUE, data = 0)
M[2, 1] <- M[3, 1] <- M[4, 2] <- M[4, 3] <- "f1"

col   <- M
col[] <- "red"
col[2, 1] <- col[3, 1] <- "blue"
pp <- plotmat(M, pos = c(1, 2, 1), curve = 0, name = 1:4,
              lwd = 1, box.lwd = 2, box.cex = 1:4, cex.txt = 0.8, 
              arr.lcol = col, arr.col = col, box.type = "circle",
              box.prop = 1.0, main = "plotmat")

pp <- plotmat(M, pos = c(1, 2, 1), curve = 0, name = 1:4,
              lwd = 1, box.lwd = 2, box.cex = 1:4, cex.txt = 0.8, 
              arr.lcol = col, arr.col = col, box.type = "circle",
              box.prop = 1.0, arr.len = 0.3,
              segment.from = 0.35, segment.to = 0.65)

M[1, 2] <- M[1, 3] <- M[2, 4] <- M[3, 4] <- "f2"

pp <- plotmat(M, pos = c(1, 2, 1), curve = 0.1, name = 1:4,
              lwd = 1, box.lwd = 2, box.cex = 1:4, cex.txt = 0.8, 
              arr.lcol = col, arr.col = col, box.type = "none",
              box.prop = 1.0, main = "plotmat", arr.len = 0.2,
              segment.from = 0.3, segment.to = 0.7)

pp <- plotmat(M, pos = c(1, 2, 1), curve = 0.1, name = 1:4, 
              box.lwd = 2, box.cex = 1:4, cex.txt = 0.8, 
              arr.lcol = col, arr.col = col, arr.pos = 0.7,
              arr.type = "simple", lwd = 2, box.type = "none",
              box.prop = 1.0, main = "plotmat", arr.len = 0.2,
              segment.from = 0.3, segment.to = 0.7)
par(mfrow=pm)
  
# self arrows
diag(M) <- "self"
pp <- plotmat(M, pos = c(2, 2), curve = 0, name = LETTERS[1:4],
              lwd = 1, box.lwd = 2, cex.txt = 0.8, self.cex = 0.5,
              self.shiftx = c(-0.1, 0.1, -0.1, 0.1),
              box.type = "diamond", box.prop = 0.5, main = "plotmat")
  
M <- matrix(nrow = 4, ncol = 4, data = 0)
M[2, 1]<- 1 ; M[4, 2] <- 2 ; M[3, 4] <- 3; M[1, 3] <- 4
pp <- plotmat(M, pos = c(1, 2, 1), curve = 0.2, name = letters[1:4],
              lwd = 1, box.lwd = 2, cex.txt = 0.8, arr.type = "triangle",
              box.size = 0.1, box.type = "hexa", box.prop = 0.5,
              main = "plotmat")

arrlwd <- M*2
arr.length <- M*0.4
cextxt <- M*0.8
plotmat(M, pos = c(1, 2, 1), curve = 0.2, name = letters[1:4], lwd = 1,
        box.lwd = 2, arr.type = "triangle", box.size = 0.1,
        box.type = "hexa", box.prop = 0.5, main = "plotmat",
        arr.lwd = arrlwd, arr.length = arr.length, cex.txt = cextxt,
        txt.font = 1:4, txt.xadj = seq(-3, 3, length.out = 4),
        txt.yadj = 1)

M <- matrix(nrow = 4, ncol = 4, byrow = TRUE, data = 0)
M     <- as.data.frame(M)
M[[2,1]]<- "k[si]"
M[[3,1]]<- "k[N]"
M[[4,2]]<- "sqrt(frac(2,3))"

names <-
  c(expression(lambda[12]), "?", 
    expression(lambda[13]),expression(lambda[23]))

plotmat(M, pos = c(1, 2, 1), name = names, lwd = 1, box.lwd = 2, 
        curve = 0, cex.txt = 0.8, box.size = 0.1, box.type = "square",
        box.prop = 0.5, main = "plotmat")
              
plotmat(M, name = letters[1:4], curve = 0, box.cex = 1:4, box.lwd = 4:1,
        box.size = 0.075, arr.pos = 0.7, 
        box.col = c("lightblue", "green", "yellow", "orange"))





