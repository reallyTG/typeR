library(ruimtehol)


### Name: embed_entityrelationspace
### Title: Build a Starspace model for entity relationship completion
### Aliases: embed_entityrelationspace

### ** Examples

## Example on Freebase
filename <- paste(
  "https://raw.githubusercontent.com/bnosac-dev/GraphEmbeddings/master/",
  "diffbot_data/FB15k/freebase_mtr100_mte100-train.txt", 
  sep = "")
x <- read.delim(filename, header = FALSE, nrows = 1000,  
                col.names = c("entity_head", "relation", "entity_tail"),
                stringsAsFactors = FALSE)
head(x)

set.seed(123456789)
model <- embed_entityrelationspace(x, dim = 50)
plot(model)

predict(model, "/m/027rn /location/country/form_of_government")

## Also add reverse relation
x_reverse <- x
colnames(x_reverse) <- c("entity_tail", "relation", "entity_head")
x_reverse$relation <- sprintf("REVERSE_%s", x_reverse$relation)

relations <- rbind(x, x_reverse)
set.seed(123456789)
model <- embed_entityrelationspace(relations, dim = 50)
predict(model, "/m/027rn /location/country/form_of_government")
predict(model, "/m/06cx9 REVERSE_/location/country/form_of_government")



