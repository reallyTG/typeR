library(stam)


### Name: DateConversion
### Title: Conversion between Different Date Format
### Aliases: DateConversion
### Keywords: date

### ** Examples

## Not run: 
##D #Example 1
##D a<-"10/20/1999"
##D DateConversion(a,DateIn="%m/%d/%Y",DateOut="%d/%m/%Y")
##D #Example 2
##D b<-"27/12/2000"
##D DateConversion(b,DateIn="%d/%m/%Y",DateOut="%m/%d/%Y")
##D #Example 3
##D c<-"20001223"
##D Date_New1<-DateConversion(c,DateIn="%Y%m%d",DateOut="%m/%d/%Y")
##D Date_New1
##D Date_New2<-DateConversion(c,DateIn="%Y%m%d",DateOut="%d/%m/%Y")
##D Date_New2
## End(Not run) 



