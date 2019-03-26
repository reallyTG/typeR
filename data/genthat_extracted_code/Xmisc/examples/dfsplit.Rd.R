library(Xmisc)


### Name: dfsplit
### Title: Split data.frame given one leveled column
### Aliases: dfsplit

### ** Examples

x <- read.table(textConnection("
chr1  0   100
chr2  100 200
chr10 200 300
"),col.names=c('chr','start','end'))

## compare the results by base::split and dfsplit
split(x,f=x[,'chr'])
## $chr1
##    chr start end
## 1 chr1     0 100

## $chr10
##     chr start end
## 3 chr10   200 300

## $chr2
##    chr start end
## 2 chr2   100 200

dfsplit(x,'chr',c('chr1','chr2','chr10'))
## $chr1
##    chr start end
## 1 chr1     0 100

## $chr2
##    chr start end
## 2 chr2   100 200

## $chr10
##     chr start end
## 3 chr10   200 300



