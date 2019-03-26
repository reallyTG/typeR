## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----id_username---------------------------------------------------------
library(relatable)
valid_ids <- 10:99 # All possible ID numbers
usernames <- # List of usernames in order of entry
  c("Leonardo", "Michelangelo", "Raphael", "Donatello") 

get_user_from_id <- relation(
  A = valid_ids,
  B = usernames,
  default = "No username found",
  relation_type = NULL,
  restrictions = list(max_one_y_per_x = TRUE, max_one_x_per_y = TRUE),
  map_error_response = "throw"  # If restrictions are violated, return an error instead
)                               # of a warning

get_user_from_id(11)

## ----many_to_many--------------------------------------------------------
## Authors have a many-to-many relation with books:
## a book can have multiple authors and authors can write multiple books
my_library <- tibble::tribble(
  ~author,				~work,
  "Arendt",				"The Human Condition",
  "Austen-Smith",		"Social Choice and Voting Models",
  "Austen-Smith",		"Positive Political Theory",
  "Banks",				"Positive Political Theory",
  "Camus",				"The Myth of Sisyphus",
  "Camus",				"The Rebel",
  "Arendt",				"The Origins of Totalitarianism",
  "Dryzek",				"Theories of the Democratic State",
  "Dunleavy",			"Theories of the Democratic State"
)

relate(
  X = c("Arendt", "Austen-Smith", "Banks", "Dryzek", "Dunleavy"),
  A = my_library$author,
  B = my_library$work,
  atomic = FALSE, # relations with multiple outputs must return lists
  named = TRUE,
  relation_type = "many_to_many"
)

## ----duplicate-----------------------------------------------------------
## Duplicate mappings usually return twice, but this can be changed...
relate(
  X = 1:3,
  A = c(1, 2, 2, 3, 4, 5),
  B = c('a', 'b', 'b', 'c', 'd', 'e'),
  relation_type = "many_to_many",
  atomic = FALSE
)

## Use relate or relation with handle_duplicate_mappings = TRUE to avoid errors resulting
## from duplicate mappings to and from the same inputs. Bijections ensure that each input
## has exactly one unique output.
relate(
  X = 1:3,
  A = c(1, 2, 2, 3, 4, 5),
  B = c('a', 'b', 'b', 'c', 'd', 'e'),
  relation_type = "bijection",
  handle_duplicate_mappings = TRUE
)

## ----advanced------------------------------------------------------------
emperors <- read.csv(
  "https://raw.githubusercontent.com/zonination/emperors/master/emperors.csv",
  stringsAsFactors = FALSE
)
colnames(emperors)

## Suppose we want a function to map each emperor to the time of their reign.
## First, let's see that a unique mapping from either name or name.full is possible by
## using relation's report properties argument:
relation(emperors$name.full, emperors$reign.start,
  relation_type = NULL,
  atomic = FALSE,
  report_properties = TRUE)

relation(emperors$name, emperors$reign.start,
  relation_type = NULL,
  atomic = FALSE,
  report_properties = TRUE)

## Neither mapping fulfils the criterion of max_one_y_per_x, but this is not a problem: in
## the later years of the Roman Empire, some emperors were co-rulers whose reigns began at
## the same time.
relate(c("0305-05-01", "0337-05-22"), emperors$reign.start, emperors$name,
  named = TRUE, relation_type = NULL, atomic = FALSE)

## However, we can infer from max_one_y_per_x = FALSE that some elements of name.full are
## non-unique. This is because both Vespasian and his eldest son and successor Titus took
## the same imperial title.
relate(c("Vespasian", "Titus"), emperors$name, emperors$name.full,
  named = TRUE)

## Hence we can determine that name and not name.full is a better choice for our mapping
## function.
reign_start <- relation(emperors$name, emperors$reign.start)
reign_start("Constantine the Great")

## Repeating the vector A can let us return multiple variables at once to return an n-tuple
nice_date <- function(s) {
  d <- as.Date(s, "%Y-%m-%d")
  return(format.Date(d, "%d %B, %Y AD"))
}

reign_duration <- relation(
  rep(emperors$name, 2),
  nice_date(c(emperors$reign.start, emperors$reign.end)),
  relation_type = NULL,
  atomic = FALSE, named = TRUE
)
reign_duration(c("Vespasian", "Titus", "Domitian"))

## Or just for fun...
obituary <- with(
  emperors,
  relation(
    A = rep(name, 3),
    B = c(
      paste0("Born in ", birth.cty, ", ", birth.prv, " on ", nice_date(birth)),
      paste0("Came to power by ", rise, " on ", nice_date(reign.start)),
      paste0("Died from ", cause, " by ", killer, " on ", nice_date(death))
    ),
    relation_type = NULL,
    atomic = FALSE, named = TRUE
  )
)

obituary(
  c("Marcus Aurelius", "Commodus", "Pertinax", "Didius Julianus", "Septimus Severus", "Caracalla")
)

