library(traitr)


### Name: choiceItem
### Title: Item for choosing one of several values
### Aliases: choiceItem

### ** Examples

## default is to get/set by value
         a <- choiceItem("a", letters, name="x")
         a$get_x()
         a$set_x("b")
         a$get_x()
## or by index, which can be easier to do
         b <- choiceItem("a", letters, name="x", by_index=TRUE)
         b$get_x()
         b$set_x(2)
         b$get_x()
## Size determines widget, unless you set editor_type
## a radio group
         rg <- choiceItem("a", letters[1:3], name="x")
## a combobox
         cb <- choiceItem("a", letters[1:8], name="x")
## a table
         tb <- choiceItem("a", letters[1:26], name="x")
## adjust size of table widget
         tb <- choiceItem("a", letters[1:26], name="x", attr=list(size=c(width=300,height=400)))
## Multiple and size determines widget type
## smaller uses checkboxgroup
         cbg <- choiceItem("a", letters[1:5], multiple=TRUE)
## larger uses table
         tbl <- choiceItem("a", letters[1:15], multiple=TRUE)
## place values in data frame to avoid generic header
         tbl <- choiceItem("a", data.frame("Column header"=letters[1:15]), multiple=TRUE)



