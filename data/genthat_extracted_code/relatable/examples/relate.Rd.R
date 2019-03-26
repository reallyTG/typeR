library(relatable)


### Name: relate
### Title: Map inputs from a vector of keys to a vector of values.
### Aliases: relate relation

### ** Examples

## Map from one vector to another
relate(c("a", "e", "i", "o", "u"), letters, LETTERS)
# [1] "A" "E" "I" "O" "U"
## or
caps <- relation(letters, LETTERS)
caps("t")
# [1] "T"
caps(c("p", "q", "r"))
# [1] "P" "Q" "R"

## Create a new column in a data frame
df <- data.frame(
name = c("Alice", "Bob", "Charlotte", "Dan", "Elise", "Frank"),
position = c("right", "lean-left", "left", "left", "lean-right", "no response")
)
positions <- c("left", "lean-left", "independent", "lean-right", "right")
colours <- c("darkblue", "lightblue", "green", "lightred", "darkred")
df$colour <- relate(df$position, positions, colours, default = "gray")
df
#        name     position    colour
# 1     Alice        right   darkred
# 2       Bob    lean-left lightblue
# 3 Charlotte         left  darkblue
# 4       Dan         left  darkblue
# 5     Elise   lean-right  lightred
# 6     Frank  no response      gray

## Authors have a many-to-many relation with books:
## a book can have multiple authors and authors can write multiple books
my_library <- data.frame(
  author = c(
    "Arendt",
    "Austen-Smith",
    "Austen-Smith",
    "Austen-Smith",
    "Banks",
    "Banks",
    "Camus",
    "Camus",
    "Arendt",
    "Dryzek",
    "Dunleavy"
  ),
  work = c(
    "The Human Condition",
    "Social Choice and Voting Models",
    "Information Aggregation, Rationality, and the Condorcet Jury Theorem",
    "Positive Political Theory I",
    "Information Aggregation, Rationality, and the Condorcet Jury Theorem",
    "Positive Political Theory I",
    "The Myth of Sisyphus",
    "The Rebel",
    "The Origins of Totalitarianism",
    "Theories of the Democratic State",
    "Theories of the Democratic State"
  ),
  stringsAsFactors = FALSE
)
relate(
  X = c("Arendt", "Austen-Smith", "Banks", "Dryzek", "Dunleavy"),
  A = my_library$author,
  B = my_library$work,
  atomic = FALSE,
  named = TRUE,
  relation_type = "many_to_many"
)
# $Arendt
# [1] "The Human Condition"            "The Origins of Totalitarianism"
#
# $`Austen-Smith`
# [1] "Social Choice and Voting Models"
# [2] "Information Aggregation, Rationality, and the Condorcet Jury Theorem"
# [3] "Positive Political Theory I"
#
# $Banks
# [1] "Information Aggregation, Rationality, and the Condorcet Jury Theorem"
# [2] "Positive Political Theory I"
#
# $Dryzek
# [1] "Theories of the Democratic State"
#
# $Dunleavy
# [1] "Theories of the Democratic State"

## Duplicate mappings will return multiple copies by default:
relate(
  X = 1:3,
  A = c(1, 2, 2, 3, 4, 5),
  B = c('a', 'b', 'b', 'c', 'd', 'e'),
  relation_type = "many_to_many",
  atomic = FALSE
)
# [[1]]
# [1] "a"
#
# [[2]]
# [1] "b" "b"
#
# [[3]]
# [1] "c"

## Use handle_duplicate_mappings = TRUE to ignore these and avoid mapping errors.
nums_to_letters <- relation(
  A = c(1, 2, 2, 3, 4, 5),
  B = c('a', 'b', 'b', 'c', 'd', 'e'),
  relation_type = "bijection",
  handle_duplicate_mappings = TRUE
)
nums_to_letters(X = c(1, 2, 3))
# [1] "a" "b" "c"

## Use relation with report_properties = TRUE to determine the properties of specified relation
domain <- -3:3
image <- domain^2
relation(domain, image, report_properties = TRUE)
# Relation properties:
# min_one_y_per_x min_one_x_per_y max_one_y_per_x max_one_x_per_y
# TRUE            TRUE            TRUE           FALSE



