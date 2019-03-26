library(politeness)


### Name: politenessPlot
### Title: Politeness plot
### Aliases: politenessPlot

### ** Examples


data("phone_offers")

polite.data<-politeness(phone_offers$message, parser="none", binary=FALSE, drop_blank=FALSE)

politeness::politenessPlot(polite.data,
                           split=phone_offers$condition,
                           split_levels = c("Tough","Warm"),
                           split_name = "Condition",
                           top_title = "Average Feature Counts")


polite.data<-politeness(phone_offers$message, parser="none", binary=TRUE, drop_blank=FALSE)

politeness::politenessPlot(polite.data,
                           split=phone_offers$condition,
                           split_levels = c("Tough","Warm"),
                           split_name = "Condition",
                           top_title = "Binary Feature Use")




