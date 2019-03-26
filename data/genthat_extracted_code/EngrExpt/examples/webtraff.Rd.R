library(EngrExpt)


### Name: webtraff
### Title: Web site traffic during a marketing campaign
### Aliases: webtraff
### Keywords: datasets

### ** Examples

str(webtraff)
dotplot(weeks ~ traffic, webtraff, type = c("p","a"),
        xlab = "Web traffic (1000's of hits per day)",
        ylab = "Weeks into the marketing campaign")



