## ----eval=FALSE----------------------------------------------------------
#  library(devtools)
#  install_github('zwdzwd/wheatmap')

## ------------------------------------------------------------------------
library(wheatmap)
m <- cbind(matrix(rnorm(20),nrow=4), 5+matrix(rnorm(8),nrow=4))
m2 <- matrix(1:16,nrow=4)
dimnames(m) <- list(c('w','x','y','z'), c('a','b','c','d','e','f','g'))
row.data <- c(1,2,3,1)
col.data <- c(1:6,6)
m[,1:4]

## ------------------------------------------------------------------------
cc <- both.cluster(m)
row.data <- row.data[cc$row.clust$order]
col.data <- col.data[cc$column.clust$order]
cc$mat[,1:4]

## ------------------------------------------------------------------------
WHeatmap(cc$mat, name='h1') +
  WColorBarV(row.data, LeftOf('h1'), 'c1') +
  WColorBarH(col.data, TopOf('h1'), 'c2') +
  WDendrogram(cc$row.clust, LeftOf('c1'), facing='right') +
  WDendrogram(cc$column.clust, TopOf('c2'), facing='bottom') +
  WColorBarV(1:4, RightOf('h1'), 'c3', continuous=TRUE) +
  WHeatmap(m2, RightOf('c3'), 'h2') +
  WColorBarH(rep(c(1,2,3),each=4), 
             Beneath(WColumnBind('h1', 'c3', 'h2')), 'c4', 
             cmp=CMPar(brewer.name='Set2'), continuous=FALSE) +
  WHeatmap(matrix(rep(c(8:1,1:8),4),nrow=4), 
           Beneath('c4', h.aln=WColumnBind('h1','c3')), 'h3') +
  WHeatmap(matrix(rep(1:10),ncol=2),LeftOf(WRowBind('c4.1.1','h3.1.1'))) +
  WHeatmap(matrix(1:4,nrow=2), RightOf('h3', h.scale='h2'), 'h4') +
  WHeatmap(matrix(1:24,nrow=3), Beneath('h3'), 'h5') +
  WHeatmap(matrix(24:1,nrow=2), 
           Beneath('h5', h.aln=WColumnBind('h1','c3','h2')), 'h6') +
  WLegendV('c1', BottomRightOf('h6.1.3', h.pad=0.01), 'l1') +
  WLegendV('c2', TopOf('l1', pad = 0.1), 'l2') +
  WLegendV('c3', RightOf('l1', pad=0.1), 'l3', n.text=3, label.fontsize = 10) + 
  WLabel('Rainbow colors', RightOf('l2', pad=0.08), rot=-90) +
  WLabel('a little\nhouse', color='black', 
         WPosition(1,2,'h4',data.coord=TRUE, just=c('center','center'))) + 
  WRect('h3.1.1', c(2,5),c(2,3),col='yellow') +
  WRect('h1',c(5,6),c(2,3),col='yellow')

## ------------------------------------------------------------------------
a <- WHeatmap(cc$mat, name='h1')
a

## ------------------------------------------------------------------------
a <- a + WColorBarV(row.data, LeftOf('h1'), 'c1')
a <- a + WColorBarH(col.data, TopOf('h1'), 'c2')
a

## ------------------------------------------------------------------------
a <- a + WDendrogram(cc$row.clust, LeftOf('c1'), facing='right')
a <- a + WDendrogram(cc$column.clust, TopOf('c2'), facing='bottom')
a

## ------------------------------------------------------------------------
a <- a + WColorBarV(1:4, RightOf('h1'), 'c3', continuous=TRUE)
a <- a + WHeatmap(m2, RightOf('c3'), 'h2')
a

## ------------------------------------------------------------------------
a <- a + WColorBarH(rep(c(1,2,3),each=4), 
                    Beneath(WColumnBind('h1', 'c3', 'h2')), 'c4', 
                    cmp=CMPar(brewer.name='Set2'), continuous=FALSE)
a

## ------------------------------------------------------------------------
a <- a + WHeatmap(
  matrix(rep(c(8:1,1:8),4),nrow=4), 
  Beneath('c4', h.aln=WColumnBind('h1','c3')), 'h3')
a <- a + WHeatmap(matrix(rep(1:10),ncol=2),
                  LeftOf(WRowBind('c4.1.1','h3.1.1')))
a

## ------------------------------------------------------------------------
a <- a + WHeatmap(
  matrix(1:4,nrow=2), RightOf('h3', h.scale='h2'), 'h4')
a <- a + WHeatmap(
  matrix(1:24,nrow=3), Beneath('h3'), 'h5')
a <- a + WHeatmap(
  matrix(24:1,nrow=2), 
  Beneath('h5', h.aln=WColumnBind('h1','c3','h2')), 'h6')
a

## ------------------------------------------------------------------------
a <- a + WLegendV('c1', BottomRightOf('h6.1.3', h.pad=0.01), 'l1')
a <- a + WLegendV('c2', TopOf('l1', pad = 0.1), 'l2')
a <- a + WLegendV('c3', RightOf('l1', pad=0.1), n.text=3)
a

## ------------------------------------------------------------------------
a <- a + WLabel('Rainbow colors', RightOf('l2', pad=0.08), rot=-90)
a <- a + WLabel('a little\nhouse', color='black', WPosition(1,2,'h4',data.coord=TRUE, just=c('center','center')))
a

## ------------------------------------------------------------------------
a <- a + WRect('h3.1.1',c(2,5),c(2,3),col='yellow')
a <- a + WRect('h1',c(5,6),c(2,3),col='yellow')
a

## ------------------------------------------------------------------------
print(a, layout.only=TRUE)

## ------------------------------------------------------------------------
m <- matrix((1:1000)/1000, nrow=100)
rownames(m) <- paste0('row', 1:100)
WHeatmap(m, yticklabels = TRUE) + WLegendV(NULL, RightOf(), height=0.5)

## ------------------------------------------------------------------------
WHeatmap(cc$mat, name='h1', 
         yticklabels = TRUE, yticklabel.fontsize=20,
         xticklabels = TRUE, xticklabel.side = 't', xticklabel.fontsize = 25)
WHeatmap(matrix(1:9,nrow=3)) + WLabel('Wosai', RightOf(), fontsize=20)
WHeatmap(matrix(1:9,nrow=3)) + WLabel('Wosai', LeftOf(), fontsize=20)
WHeatmap(matrix(1:9,nrow=3)) + WLabel('Wosai', TopLeftOf(just=c('center','bottom')), fontsize=20, color='blue')
WHeatmap(matrix(1:9,nrow=3)) + WLabel('Wosai', WPosition(0.25,0.5,just=c('center','bottom')), fontsize=20, color='yellow')

## ------------------------------------------------------------------------
WHeatmap(matrix(1:1)) +
  WHeatmap(matrix(1:2), RightOf()) +
  WHeatmap(matrix(c('fred','frank','brad','frank','fred','frank'), ncol=2), RightOf()) + 
  WLegendV(NULL, BottomRightOf(h.pad=0.1), label.fontsize = 20, yticklabel.pad=0.05) +
  WCustomize(mar.right=0.1)

## ------------------------------------------------------------------------
a <- WHeatmap(matrix(1:9,nrow=3)) + 
  WHeatmap(matrix(1:16,nrow=4), BottomRightOf(just=c('left','top'))) + 
  WHeatmap(matrix(1:9,nrow=3), BottomLeftOf(just=c('right','top'))) + 
  WHeatmap(matrix(1:16,nrow=4), TopLeftOf(just=c('right','bottom')))
a
ly(a)

## ------------------------------------------------------------------------
WHeatmap(matrix(1:20,nrow=4)) + WRect(NULL,c(2,3),c(3,3), color='red', lwd=10)

