library(radiant.design)


### Name: doe
### Title: Create (partial) factorial design
### Aliases: doe

### ** Examples

doe(c("price; $10; $13; $16", "food; popcorn; gourmet; no food"))
doe(
  c("price; $10; $13; $16", "food; popcorn; gourmet; no food"),
  int = "price:food", trials = 9, seed = 1234
)




