library(metaDigitise)


### Name: process_new_files
### Title: process_new_files
### Aliases: process_new_files

### ** Examples

## No test: 
# temporary directory
tmp_dir <- tempdir()

# Simulate data
set.seed(103)
x <- rnorm(20,0,1)
y <- rnorm(20,0,1)
means <- c(mean(x),mean(y))
ses <- c(sd(x)/sqrt(length(x))*1.96, sd(y)/sqrt(length(y))*1.96)

#Generate mock mean error plot
png(filename = paste0(tmp_dir,"/mean_error.png"), width = 480, height = 480)
plot(means, ylim = c(min(means-ses)-0.1,max(means+ses)+0.1), xlim=c(0.5,2.5), 
xaxt="n", pch=19, cex=2, ylab="Variable +/- SE", xlab="Treatment", main="Mean Error")
arrows(1:length(means),means+ses, 1:length(means), means-ses, code=3, angle=90, length=0.1)
axis(1,1:length(means),names(means))
dev.off()

## Not run: 
##D #metaDigitise figures
##D 	data <- process_new_files(paste0(tmp_dir, "/"), summary = TRUE, cex = 2)
## End(Not run)
## End(No test)



