library(RSEIS)


### Name: jitter.lab
### Title: Jitter a set of labels
### Aliases: jitter.lab
### Keywords: misc

### ** Examples

 APAL  <- 
   c('tan2','red2','lightpink3','chocolate4','blue3','thistle4','lightcyan4',
   'orangered1','purple4','darkred','dodgerblue1','gold3','chartreuse','sienna4',
   'aquamarine3','mistyrose4','sienna1','darkkhaki','darkgoldenrod4','magenta4',
   'pink3','orangered','darkslategray4','red3','goldenrod3','palegreen4','deepskyblue3',
   'turquoise3','seagreen4','springgreen4','gold4','lightsalmon4','limegreen','orchid4',
   'darkseagreen4','chartreuse3','goldenrod4','salmon2','deeppink3','forestgreen',
   'lightskyblue4','mediumorchid3','deepskyblue2','chocolate2','violetred4','blue1',
    'honeydew4','darkgreen','royalblue1','lightseagreen')

  
s <- sort(sample.int(100,25))
plot(c(1,110),c(0,8),col='white')  #### set up plot area


PplusPHASE <- c( "P-up","P","Pdiff","PKP","PKiKP","PcP",
"pP","pPdiff","pPKP","pPKiKP","sP","sPdiff","sPKP","sPKiKP")
 SplusPHASE  <-  c("S-up","S","Sdiff","SKS","sS",
"sSdiff","sSKS","pS","pSdiff","pSKS")
basic1  <-   c("ScP", "SKP", "PKKP", "SKKP", "PP",  "PKPPKP")
basicPHASE  <-  c(PplusPHASE,SplusPHASE, basic1)  
PHS  <-  basicPHASE[1:25]

x  <-  s
y  <-  rep(0, length(x))

RMAT  <-    RPMG::textrect(x,y, PHS, xpd=TRUE, add=FALSE, font=1, cex=.8 )

    newjitx  <-  jitter.lab(RMAT[,1]  , RMAT[,3]-RMAT[,1])
    y  <-  y+newjitx*(RMAT[,4]-RMAT[,2])


MCOL  <- length(PHS)

    PASTCOL <- APAL[1:MCOL]
    RMAT <- RPMG::textrect(x,y, PHS, xpd=TRUE,
            add=TRUE, textcol=PASTCOL,  font=1, cex=.8 )





