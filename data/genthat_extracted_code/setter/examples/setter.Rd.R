library(setter)


### Name: setter
### Title: Set attributes of variables
### Aliases: copy_all_attributes copy_attributes copy_class copy_colnames
###   copy_comment copy_dim copy_dimnames copy_length copy_levels copy_mode
###   copy_most_attributes copy_names copy_rownames copy_storage_mode
###   mutator set_attributes set_class set_colnames set_comment set_dim
###   set_dimnames set_length set_levels set_mode set_names set_rownames
###   set_storage_mode setter setters

### ** Examples

if(requireNamespace("magrittr"))
{
  `%>%` <- magrittr::`%>%`
  # Convert a vector to a matrix by setting the dimensions and their names.
  m <- 1:12 %>%
    set_dim(3:4) %>%
    set_dimnames(list(letters[1:3], LETTERS[1:4])) %>%
    print

  # Copy attributes from one variable to another using copy_* fns.
  month.abb %>%
    copy_dim(m) %>%
    copy_dimnames(m) %>%
    print

  # Same again, using copy_attributes
  month.abb %>%
    copy_attributes(m, c("dim", "dimnames"))

  # Same again, in this case you can copy most/all the attributes from m.
  month.abb %>%
    copy_most_attributes(m)
  month.abb %>%
    copy_all_attributes(m)

  # To quickly convert a list into a data.frame, set the class and row names.
  list(a = (1:5) ^ 2, b = pi ^ (1:5)) %>%
    set_class("data.frame") %>%
    set_rownames() %>%   # data.frames have a default
    print

  # Or equivalently, using attributes
  list(a = (1:5) ^ 2, b = pi ^ (1:5)) %>%
    set_attributes(class = "data.frame", row.names = .set_row_names(5)) %>%
    print
} else
{
  message('This example requires the magrittr package.  Please run install.packages("magrittr").')
}



