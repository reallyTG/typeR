library(strex)


### Name: str_nth_number_before_mth
### Title: Find the nth number before the mth occurrence of a pattern.
### Aliases: str_nth_number_before_mth str_nth_number_before_first
###   str_nth_number_before_last str_first_number_before_mth
###   str_last_number_before_mth str_first_number_before_first
###   str_first_number_before_last str_last_number_before_first
###   str_last_number_before_last

### ** Examples

string <- c("abc1abc2abc3abc4def5abc6abc7abc8abc9",
            "abc1def2ghi3abc4def5ghi6abc7def8ghi9")
str_nth_number_before_mth(string, "def", 1, 1)
str_nth_number_before_mth(string, "abc", 2, 3)
str_nth_number_before_first(string, "def", 2)
str_nth_number_before_last(string, "def", -1)
str_first_number_before_mth(string, "abc", 2)
str_last_number_before_mth(string, "def", 1)
str_first_number_before_first(string, "def")
str_first_number_before_last(string, "def")
str_last_number_before_first(string, "def")
str_last_number_before_last(string, "def")



