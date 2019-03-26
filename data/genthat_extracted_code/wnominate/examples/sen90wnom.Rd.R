library(wnominate)


### Name: sen90wnom
### Title: 90th U.S. Senate Ideal Points
### Aliases: sen90wnom
### Keywords: datasets

### ** Examples

    #This data file is the same as reading file using:
    #sen90 <- readKH("ftp://voteview.com/sen90kh.ord")
    #All ORD files can be found on www.voteview.com
    data(sen90)
    
    summary(sen90)
    #sen90wnom <- wnominate(sen90,polarity=c(2,5))
    #'sen90wnom' is the same nomObject as found in 
    data(sen90wnom)
    summary(sen90wnom)
    plot(sen90wnom)



