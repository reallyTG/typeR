library(FSAdata)


### Name: CreelMN
### Title: Results of a large number of creel surveys in Minnestoa lakes.
### Aliases: CreelMN
### Keywords: datasets

### ** Examples

data(CreelMN)
str(CreelMN)
head(CreelMN)
levels(CreelMN$species)

## ONLY RUN IN INTERACTIVE MODE
## Not run: 
##D   require(FSA)
##D   wae <- Subset(CreelMN,species=="WAE")
##D   ( waetbl <- table(wae$harvest) )
##D   ( waeptbl <- prop.table(waetbl)*100 )
##D   ( waercum <- rcumsum(waeptbl) )
##D   op <- par(mfrow=c(1,2),mar=c(3.5,3.5,0.5,0.5),mgp=c(2,0.5,0))
##D   barplot(waeptbl,xlab="Number of Walleye Harvested",ylab="Percentage of Individuals")
##D   barplot(waercum,xlab="Minimum Number of Walleye Harvested",ylab="Percentage of Individuals")
##D   par(op)       
##D   ( ttlwae <- sum(wae$harvest) )                 
##D   wae$svd5 <- wae$harvest-5             # Used to determine the number of fish                
##D   xtabs(~svd5,data=wae)                 #   saved if limit was reduced to 5.
##D   ( svd5 <- sum(wae$svd5[wae$svd5>0]) ) #   Only sum positive numbers (i.e., saved)
##D   round(svd5/ttlwae*100,1)              # Show as a percentage
##D 
##D   wae$svd1 <- wae$harvest-1             # same but if reduced to 1 bag.    
##D   xtabs(~svd1,data=wae)
##D   ( svd1 <- sum(wae$svd1[wae$svd1>0]) )
##D   round(svd1/ttlwae*100,1)
##D 
## End(Not run)




