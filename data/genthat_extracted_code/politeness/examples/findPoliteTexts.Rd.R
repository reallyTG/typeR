library(politeness)


### Name: findPoliteTexts
### Title: Find polite text
### Aliases: findPoliteTexts

### ** Examples


data("phone_offers")
polite.data<-politeness(phone_offers$message, parser="none",drop_blank=FALSE)

findPoliteTexts(phone_offers$message,
                polite.data,
                phone_offers$condition,
                type = "most",
                num_docs = 5)

findPoliteTexts(phone_offers$message,
                polite.data,
                phone_offers$condition,
                type = "least",
                num_docs = 10)




