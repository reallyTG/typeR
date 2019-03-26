library(EngrExpt)


### Name: cheese
### Title: Percentage fat in cheese
### Aliases: cheese
### Keywords: datasets

### ** Examples

str(cheese)
bwplot(batch ~ fat|plant, cheese, layout = c(1,3), strip = FALSE,
       strip.left = TRUE,
       xlab = "Percentage fat content of batches from three plants")
dotplot(reorder(reorder(plant:batch, fat), as.numeric(plant)) ~ fat |
        reorder(plant, fat), cheese, strip = FALSE, strip.left = TRUE,
        layout = c(1, 3), scales = list(y = list(relation = "free")),
        aspect = 0.2, type = c("p", "a"), xlab =
"Percentage fat content - lines join mean fat content per batch",
        ylab = "Batch within plant", jitter.y = TRUE)



