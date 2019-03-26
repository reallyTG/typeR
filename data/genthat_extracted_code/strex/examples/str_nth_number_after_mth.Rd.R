library(strex)


### Name: str_nth_number_after_mth
### Title: Find the nth number after the mth occurrence of a pattern.
### Aliases: str_nth_number_after_mth str_nth_number_after_first
###   str_nth_number_after_last str_first_number_after_mth
###   str_last_number_after_mth str_first_number_after_first
###   str_first_number_after_last str_last_number_after_first
###   str_last_number_after_last

### ** Examples

string <- c("abc1abc2abc3abc4abc5abc6abc7abc8abc9",
            "abc1def2ghi3abc4def5ghi6abc7def8ghi9")
str_nth_number_after_mth(string, "abc", 1, 3)
str_nth_number_after_mth(string, "abc", 2, 3)
str_nth_number_after_first(string, "abc", 2)
str_nth_number_after_last(string, "abc", -1)
str_first_number_after_mth(string, "abc", 2)
str_last_number_after_mth(string, "abc", 1)
str_first_number_after_first(string, "abc")
str_first_number_after_last(string, "abc")
str_last_number_after_first(string, "abc")
str_last_number_after_last(string, "abc")



