library(cape)


### Name: report.progress
### Title: Print the progress of a function to the screen
### Aliases: report.progress
### Keywords: arith internal

### ** Examples

	
#report progress every 10 percent, print dots every 2%
all.steps <- 1:100
for(i in all.steps){
	report.progress(i, total = length(all.steps), percent.text = 10, percent.dot = 2)
}

#report progress every 25 percent, print dots every 5%
all.steps <- 1:100
for(i in all.steps){
	report.progress(i, total = length(all.steps), percent.text = 25, percent.dot = 5)
}




