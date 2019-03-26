library(metaDigitise)


### Name: get_notDone_file_details
### Title: get_notDone_file_details
### Aliases: get_notDone_file_details

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

#Generate mock figures
png(filename = paste0(tmp_dir,"/mean_error.png"), width = 480, height = 480)
plot(means, ylim = c(min(means-ses)-0.1,max(means+ses)+0.1), xlim=c(0.5,2.5), 
xaxt="n", pch=19, cex=2, ylab="Variable +/- SE", xlab="Treatment", main="Mean Error")
arrows(1:length(means),means+ses, 1:length(means), means-ses, code=3, angle=90, length=0.1)
axis(1,1:length(means),names(means))
dev.off()
png(filename = paste0(tmp_dir, "/boxplot.png"), width = 480, height = 480)
boxplot(x,y, main="Boxplot")
dev.off()
png(filename = paste0(tmp_dir, "/histogram.png"),width = 480, height = 480)
hist(c(x,y), xlab= "variable", main="Histogram")
dev.off()
png(filename = paste0(tmp_dir, "/scatterplot.png"), width = 480, height = 480)
plot(x,y, main="Scatterplot")
dev.off()

#Obtain file names that are incomplete within the tmp directory
data <- get_notDone_file_details(tmp_dir)
## End(No test)



