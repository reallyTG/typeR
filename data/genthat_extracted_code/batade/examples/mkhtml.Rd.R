library(batade)


### Name: mkhtml
### Title: make HTML report with text and images
### Aliases: mkhtml
### Keywords: ~kwd1 ~kwd2

### ** Examples


#prepare a image file.
png("sample.png")
plot(iris$Sepal.Length, iris$Sepal.Width)
dev.off()

#make a dataframe for the report rayout
df <- data.frame("This is a sample report.", "LL", stringsAsFactors=FALSE)
df[2,] <- c("This is a caption.", "L")
df[3,] <- c("This is a caption2.", "M")
df[4,] <- c("This is a text.", "S")
df[5,] <- c("sample.png", "S")
df[6,] <- c("This is a foot note", "S")

mkhtml("sample.html", df)

#If you use a web-browser supporting CSS3, you can edit text parts on it.



