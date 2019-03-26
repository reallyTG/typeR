library(DAAG)


### Name: cuckoos
### Title: Cuckoo Eggs Data
### Aliases: cuckoos
### Keywords: datasets

### ** Examples
 
print("Strip and Boxplots - Example 2.1.2")

attach(cuckoos)
oldpar <- par(las = 2) # labels at right angle to axis.
stripchart(length ~ species) 
boxplot(split(cuckoos$length, cuckoos$species),
         xlab="Length of egg", horizontal=TRUE)
detach(cuckoos)
par(oldpar)
pause()

print("Summaries - Example 2.2.2")
sapply(split(cuckoos$length, cuckoos$species), sd)
pause()

print("Example 4.1.4")
wren <- split(cuckoos$length, cuckoos$species)$wren
median(wren)
n <- length(wren)
sqrt(pi/2)*sd(wren)/sqrt(n)  # this s.e. computation assumes normality



