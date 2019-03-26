## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----demodata------------------------------------------------------------
library(pmd)
data("spmeinvivo")
str(spmeinvivo)

## ----rtg-----------------------------------------------------------------
pmd <- getpaired(spmeinvivo, rtcutoff = 10, ng = 10)
plotrtg(pmd)

## ----pmd-----------------------------------------------------------------
plotpaired(pmd)

## ----pmdindex------------------------------------------------------------
# show the unique PMD found by getpaired function
for(i in 1:length(unique(pmd$paired$diff2))){
        diff <- unique(pmd$paired$diff2)[i]
        index <- pmd$paired$diff2 == diff
        plotpaired(pmd,index)
}

## ----std-----------------------------------------------------------------
std <- getstd(pmd)

## ----stdplot-------------------------------------------------------------
plotstd(std)

## ----stdrtplot-----------------------------------------------------------
par(mfrow = c(2,3))
plotstdrt(std,rtcluster = 23,main = 'Retention time group 23')
plotstdrt(std,rtcluster = 9,main = 'Retention time group 9')
plotstdrt(std,rtcluster = 18,main = 'Retention time group 18')
plotstdrt(std,rtcluster = 67,main = 'Retention time group 67')
plotstdrt(std,rtcluster = 49,main = 'Retention time group 49')
plotstdrt(std,rtcluster = 6,main = 'Retention time group 6')

## ----pca-----------------------------------------------------------------
library(enviGCMS)
par(mfrow = c(1,2),mar = c(4,4,2,1)+0.1)
plotpca(std$data,lv = as.numeric(std$group$class),main = substitute(paste(italic('in vivo'), " SPME samples(all peaks)")))
plotpca(std$data[std$stdmassindex,],lv = as.numeric(std$group$class),main = substitute(paste(italic('in vivo'), " SPME samples(selected peaks)")))

## ----sda-----------------------------------------------------------------
sda <- getsda(std, freqcutoff = 10)

## ----stdsda--------------------------------------------------------------
plotstdsda(sda)

## ----stdsdaidx-----------------------------------------------------------
par(mfrow = c(2,3),mar = c(4,4,2,1)+0.1)
plotstdsda(sda,sda$sda$diff2 == 0)
plotstdsda(sda,sda$sda$diff2 == 13.98)
plotstdsda(sda,sda$sda$diff2 == 15.99)
plotstdsda(sda,sda$sda$diff2 == 14.02)
plotstdsda(sda,sda$sda$diff2 == 28.03)
plotstdsda(sda,sda$sda$diff2 == 58.04)

## ----all,eval=F----------------------------------------------------------
#  sdaall <- getsda(spmeinvivo)
#  par(mfrow = c(2,3),mar = c(4,4,2,1)+0.1)
#  plotstdsda(sdaall,sdaall$sda$diff2 == 0)
#  plotstdsda(sdaall,sdaall$sda$diff2 == 13.98)
#  plotstdsda(sdaall,sdaall$sda$diff2 == 15.99)
#  plotstdsda(sdaall,sdaall$sda$diff2 == 14.02)
#  plotstdsda(sdaall,sdaall$sda$diff2 == 28.03)
#  plotstdsda(sdaall,sdaall$sda$diff2 == 58.04)

## ----wrap----------------------------------------------------------------
result <- globalstd(spmeinvivo)

