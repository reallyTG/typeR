library(diffrprojects)


### Name: diffrproject
### Title: class for diffrproject
### Aliases: diffrproject
### Keywords: data

### ** Examples





## Creating a Diffrprojects Instance

# To create a diffrproject we use the diffrproject creator object -
# its simply an object with an function that knows how to create a project.

# Creating a project looks like this:

library(diffrprojects)
dp <- diffrproject$new()


# Et viola - we created a first, for now empty, project that we will
# use throughout the tutorial.





## Some Help Please

# To get a better idea about what this thing called *diffrproject* really is
# you can consult its help page which gives a broad overview over its
# capabilities:

?diffrproject


# Another way is to call the ls() method. This will present us with a
# data frame listing all fields where data is stored and all the methods
# (aka object specific functions) of our diffrprojects instance.
# Those methods and fields located in *private* are not for the user
# to mess around with while non-private (*self* aka public) data fields
# can be read by the user and public methods can be triggered by the
# user to manipulate the data or retrieve data in a specific format.


dp$ls()


# The base R class() function furthermore reveals from which classes the
# diffrproject class inherits:

class(dp)



## Adding Texts to Projects

# Our diffrproject (`dp`) has one method called `text_add()` that allows to
# add texts to the project. Basically the method can be used in three
# different flavors: adding character vectors, adding texts stored on disk,
# or by adding rtext objects (see rtext package:
# https://CRAN.R-project.org/package=rtext; rtext objects are the way
# individual texts are represented within diffrprojects).
# For each of these used cases there is one option:
# `text`, `text_file`, `rtext`; respectively.

# Below are shown examples using each of these methods:


#  **adding text files**

test_file1 <- stringb:::test_file("rc_1_ch1.txt")
test_file2 <- stringb:::test_file("rc_2_ch1.txt")
dp$text_add(text_file = c(test_file1, test_file2) )


# **adding rtext objects**

test_file <- stringb:::test_file("rc_1_ch1.txt")
rt <- rtext$new( text_file = test_file)
dp$text_add(rtext = rt)


# **adding character vectors**

test_file1 <- stringb:::test_file("rc_1_ch1.txt")
test_file2 <- stringb:::test_file("rc_2_ch1.txt")
cv <- ""
cv[1] <- text_read(test_file1, NULL)
cv[2] <- text_read(test_file2, NULL)
dp$text_add(text = cv)

# In the last case make sure to put each text in one separate line.
# Functions like readLines() or text_read() read in texts such that
# each line corresponds to one element in a character vector. With e.g.
# text_read()'s tokenize parameter to NULL the text will be read in as one
# long string.




## Piping Methods

# Now is a good time to mention a feature of diffrprojects that comes in
# handy: All functions that do not explicitly extract data
# (those usually have some 'get' as part of their name) do return the
# object itself so that one can pipe together a series of method calls.

# Consider the following example where we initiate a new diffrprojects
# instance and add two texts in just one pipe:

dp <-
  diffrproject$
  new()$
  text_add(text_version_1, name = "version1")$
  text_add(text_version_2, name = "version2")

length(dp$text)






## Getting Infos About Texts

# If we want to get some general overview about the texts gathered in our
# project, we can use the text_meta_data() method to do so.
# The method has no parameters and returns a data.frame with several
# variables informing us about its source, length, encoding used for
# storage, and its name.


dp$text_meta_data()




## Showing Text

# If you want to have a look at your texts you may do so by using the
# text's own text_show methods. Per default this method only shows the
# first 500 characters, but it can be set to higher numbers as well.


dp$text$version1$text_show(length=1000)
dp$text$version2$text_show(length=1000)




## Getting And Setting Infos About the Project

# Similar to the text_meta_data() method we can access the projects
# meta data via data fields meta and options. But contrary to the
# text_meta_data() method that gathers data from all the texts within the
# project and does not allow for manipulation of the data, the data
# fields allow reading and writing.

# First let us have a look and thereafter turn off the message
# notification service:

# **getting data fields**

dp$options


# **setting data fields**

dp$options$verbose <- FALSE


# (note, ask is deprecated and only remains for compatibility
# reasons but has no function anymore)

# Now it's time to have a look at the projects meta data.
# It tells us when the project was created, which path to use for
# SQLite exports, which path to use for saving data as in RData
# format and what is the projects id. The id is a hash of a time stamp
# as well as session information which should ensure uniqueness across
# space and time.

# All these values can be manipulated by the user to her liking.


dp$meta

dp$meta$file_path = "./diffrproject.RData"








## Deleting Texts

# Of cause we can not only add texts but delete them from the project as
# well. For this purpose there is the text_delete() method.

# Let's just add two texts and delete one by providing its index number and
# the second by providing its name to the text_delete() method.


dp$text_add(text = "nonesense", "n1")
dp$text_add(text = "nonesense", "n2")

dp$text_delete(3)
dp$text_delete("n2")

length(dp$text)
names(dp$text)








## Defining Relationships Between Texts: Linking

# The purpose of diffrprojects is to enable data collection on the
# difference of texts. Having filled a project with various texts,
# there are endless possibilities to form pairs of text for comparison
# and change measurement - where endless actually is equal to: $n^2-n$.

# Linking can be done via the text_link method which accepts either
# index numbers or text names for its from and to arguments
# (a third argument delete will delete a specified link if set to TRUE).


dp$text_link(from = 1, to = 2)
dp$text_link(from = 1, to = 2, delete = TRUE)


# If no arguments are specified, text_link will link the first text to
# the second, the third to the fourth, the fourth to the fifths and so on.


dp$text_link()



# To get an idea of what links are currently specified, we can
# directly access the link data field or/and ask R to transform the
# list found there into a data.frame.


dp$link

dp$link %>% as.data.frame()









## Aligning Texts and Measuring Change

# At the heart of each diffrproject lies the text_align method.
# This method compares two texts and tries to align parts
# of one text with parts of the other text. The first two
# arguments (`t1` and `t2`) are for specifying which pair
# of texts to compare - if left as-is, all text pairs that
# are specified within the link data field will be aligned.

# Text parts are arbitrary character spans defined by the
# `tokenizer` argument. This argument expects a function splitting
# text into a token data.frame. If the tokenizer argument
# is left as-is, it will default to text_tokenize_lines function
# from the stringb package.

# Text tokens can be pre-processed before alignment. The `clean`
# argument allows to hand over a function tranforming a charactr
# vector of text tokens into their clean counterparts.

# The `ignore` arguments expects a function that is able to
# transform a character vector of tokens into a logical vector
# of same length, indicating which tokens to ignore throughout
# the alignment process and which to consider.

# The next argument - `distance` - specifies which distance
# metrics to use to calculate distances between strings.

# Since the text_align method basically is a wrapper around
# diff_align you can get more information via `?diff_align`
# and since again diff_align is a wrapper around stringdist
# from the stringdist package `?stringdist::stringdist` and
# also ``?stringdist::`stringdist-metrics` `` will provide
# further insights about possible metrics and how to use the
# rest of the arguments to text_align (these are passed through
# to stringdist).

# Let's have an example using the Levenshtein distance to
# calculate distances between tokens (lines per default).
# Furthermore we allow the distance between two aligned tokens
# to be as large as 15. Tokens which do not find a partner
# below that distance are considered to have been deleted
# or respectively inserted. Tokens which find a partner with
# a non-zero distance which is not above the threshhold are
# considered changes - transformations of one token into the other.

# The following shows the resulting list of alignment data.frames.


dp$text_align(distance = "lv", maxDist = 15)

dp$alignment



# To measure the change between those two texts we can e.g. aggregate
# the distances by change type:


sum_up_changes <- function(x){
x %>%
dplyr::group_by(type) %>%
dplyr::summarise(sum_of_change = sum(distance))
}

lapply( dp$alignment, sum_up_changes)






## Coding Texts

# Now let us put some data into our diffrproject.

# The most basic method to do so is simply called text_code.
# Text_code takes up
# to five arguments (the first three are mandatory), where one
# specifies the text to be coded (`text`, either by index
# number or by name), how the variable to store the information
# is called (`x`), and the index number or a vector of those
# indicating which characters of the text should be coded.
# The last two parameters are optional and specify which value
# the variable should hold (`val`) and at which hierarchy
# level the coding is placed (`hl`, higher or equal hierarchy
# levels will overwrite existing codings of lower hierarchy
# level for the same text, character span, and variable).


dp$text_code(text = 1, x = "start", i=1:5, val = TRUE, hl = 0)
dp$text_code(text = "version2", x = "start", i=1:5, val = TRUE, hl = 0)


# The text_code method is quite verbose and in most cases more suited
# to be accessed by a machine or algorithm than by a human.
# Therefore, there are three other methods to code text:
# text_code_regex, text_code_alignment_token,
# text_code_alignment_token_regex.

# The text_code_regex method allows to search for text patterns and
# code a whole pattern instead of assigning codes character by
# character - the `i` argument of text_code gets replaced by a
# `pattern` argument. The in addition further arguments can be
# passed to the pattern search functions via `...` - see e.g.
# `?grep` for possible further arguments and
# https://stat.ethz.ch/R-manual/R-devel/library/base/html/regex.html for a
# description of regular expressions in R.

# In this example we are searching for the word *"it"* in text 1 and code
# each instance.


dp$text_code_regex(text = 1, x = "it", pattern = "\\bit\\b", ignore.case=TRUE)


# Another variant of coding text is by using alignment tokens.
# Having alignment data availible, this allows for selecting:
# link, alignment and text while the other arguments from above stay the
# same.



# having a look at alignment number 4

dp$alignment[[1]][4,]


# coding text connected by alignment number 4

dp$text_code_alignment_token(
  link        = 1,
  alignment_i = 4,
  text1       = TRUE,
  text2       = TRUE,
  x   = "token_coding",
  val = 4,
  hl  = 0
)








## Getting Text Codings

# The most basic way to get text data is to use the text_data method.
# This method will go through all or only selected texts, gather all
# the data stored there and put it into a neat data.frame where name
# identifies the text from which the data comes per name, char informs
# us about the character that was coded, and i refers to the characters
# position within the text. All other variables hold the data we added
# during the examples above.


dp$text_data(text = 1) %>% head()






## Aggregating Text Codings

# The usage of text_data has its merits but often one is more
# interested in text data aggregated to a specific level.
# The following three aggregation functions offer a solution
# to this problem: tokenize_text_data_lines, tokenize_text_data_words,
# and tokenize_text_data_regex. These three methods make use
# of the similiary named methods provided by the rtext package.

# One important thing to keep in mind is that using these methods
# implies aggregating several data values on character level
# into one data value at token level. Therefore there has
# to be some aggregation function to be involved. The default
# is to use the value that occurs most often on character
# level, if more than one distinct values occur more than
# once the first is choosen.

# The aggregation function can be changed to whatever function the
# user seems appropriate by passing it to `aggregate_function`
# - as long as it
# reduces a vector of values into a vector with only one value.

# The `join` argument allows to decide how text and data are
# joined
# into the resulting data.frame - left: all token, right: all data, full:
# token with or without data and data with or without token.


dp$tokenize_text_data_lines(
text = 1,
join = "right",
aggregate_function =
function(x){
paste(x[1:3], collapse = ",")
}
)







## Text Coding Inheritence

# Having aligned two texts via token pairs another functionality of
# diffrprojects becomes availible: text coding inheritance via no-change
# tokens. This means that text codings can get copied to those tokens they
# are aligned with, given that they are considered the same - i.e. the
# distance equals zero and the change type therefore is no-change.

# To show this feature we use the text_inherit method and we will
# start with a fresh example. A new project with two texts. The first text
# gets some codings, then they are aligned, and in a last step codings are
# transfered from one text to the other via the text_data_inherit method.



dp <-
diffrproject$new()$
text_add(text_version_1)$
text_add(text_version_2)$
text_code_regex(
text    = 1,
x       = "test1",
pattern = "This part.*?change",
val = "inherited"
)$
text_code_regex(
text    = 1,
x       = "test2",
pattern = "This part.*?change",
val = "inherited"
)

dp$tokenize_text_data_lines(1)


dp$
text_link()$
text_align()$
text_data_inherit(
link      = 1,
direction = "forward"
)

dp$tokenize_text_data_lines(2)




## Saving and Loading Projects

# Diffrprojects also allow for storing and loading project to and
# from disk.

# note, uncomment code lines to run

# save to file
# dp$save(file = "dp_save.RData")

# remove object
# rm(dp)

# create new object and load saved data into new object
# dp <- diffrproject$new()
# dp$load("dp_save.RData")
# dp$tokenize_text_data_lines(2)











