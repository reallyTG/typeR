library(filesstrings)


### Name: nth_number_before_mth
### Title: Find the nth number before the mth occurrence of a pattern.
### Aliases: nth_number_before_mth nth_number_before_first
###   nth_number_before_last first_number_before_mth last_number_before_mth
###   first_number_before_first first_number_before_last
###   last_number_before_first last_number_before_last

### ** Examples

string <- c("abc1abc2abc3abc4def5abc6abc7abc8abc9",
            "abc1def2ghi3abc4def5ghi6abc7def8ghi9")
nth_number_before_mth(string, "def", 1, 1)
nth_number_before_mth(string, "abc", 2, 3)
nth_number_before_first(string, "def", 2)
nth_number_before_last(string, "def", -1)
first_number_before_mth(string, "abc", 2)
last_number_before_mth(string, "def", 1)
first_number_before_first(string, "def")
first_number_before_last(string, "def")
last_number_before_first(string, "def")
last_number_before_last(string, "def")



