library(arules)


### Name: itemCoding
### Title: Item Coding - Handling Item Labels and Column IDs
### Aliases: itemCoding itemcoding decode decode,numeric-method
###   decode,list-method encode encode,numeric-method encode,list-method
###   encode,character-method recode recode,itemMatrix-method
### Keywords: manip

### ** Examples

data("Adult")

## Example 1: Manual decoding
## get code
iLabels <- itemLabels(Adult)
head(iLabels)

## get undecoded list and decode in a second step
list <- LIST(Adult[1:5], decode = FALSE)
list

decode(list, itemLabels = iLabels)

## Example 2: Manually create an itemMatrix 
data <- list(
    c("income=small", "age=Young"),
    c("income=large", "age=Middle-aged")
    )

iM <- encode(data, iLabels)
iM

inspect(iM)

## use the itemMatrix to create transactions
as(iM, "transactions")


## Example 3: use recode
## select first 100 transactions and all education-related items
sub <- Adult[1:100, itemInfo(Adult)$variables ==  "education"]
itemLabels(sub)
image(sub)

## recode to match Adult again
sub.recoded <- recode(sub, match = Adult)
image(sub.recoded)



