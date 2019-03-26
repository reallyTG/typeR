library(divDyn)


### Name: categorize
### Title: Mapping multiple entries to categories
### Aliases: categorize

### ** Examples

# Example 1
# x, as character
   set.seed(1000)
   toReplace <- sample(letters[1:6], 15, replace=TRUE)
# a and b should mean 'first', c and d 'second' others: NA
   key<-list(first=c("a", "b"), second=c("c", "d"), default=NA)
# do the replacement
  categorize(toReplace, key)

# Example 2 - numeric entries and mixed types
# basic vector to be grouped
  toReplace2<-1:16

# replacement rules: 5,6,7,8,9 should be "more", 11 should be "eleven" the rest: "other"
  key2<-list(default="other", more=c(5,10),eleven=11)
  categorize(toReplace2, key2)

# Example 3 - multiple occurrences of same values
# a and b should mean first, a and should mean 'second' others: NA
  key3<-list(first=c("a", "b"), second=c("a", "d"), default=NA)
# do the replacement (all "a" entries will be replaced with "second")
  categorize(toReplace, key3)
   



