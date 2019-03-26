library(qdapRegex)


### Name: rm_
### Title: Remove/Replace/Extract Function Generator
### Aliases: rm_ ex_

### ** Examples

rm_digit <- rm_(pattern="[0-9]")
rm_digit("  I 12 li34ke ice56cream78.  ")

rm_lead <- rm_(pattern="^\\s+", trim = FALSE, clean = FALSE)
rm_lead("  I 12 li34ke ice56cream78.    ")

rm_all_except_letters <- rm_(pattern="[^ a-zA-Z]")
rm_all_except_letters("  I 12 li34ke ice56cream78.    ")

extract_consec_num <- rm_(pattern="[0-9]+", extract = TRUE)
extract_consec_num("  I 12 li34ke ice56cream78.  ")

## Using the supplemental dictionary dataset:
x <- "A man lives there!  The dog likes it. I want the map. I want an apple."

extract_word_after_the <- rm_(extract=TRUE, pattern="@after_the")
extract_word_after_a <- rm_(extract=TRUE, pattern="@after_a")
extract_word_after_the(x)
extract_word_after_a(x)

f <- rm_(pattern="@time_12_hours")
f("I will go at 12:35 pm")

x <- c(
    "test@aol.fg.com",
    "test@hotmail.com",
    "test@xyzrr.lk.edu",
    "test@abc.xx.zz.vv.net"
)

file_ext2 <- rm_(pattern="(?<=\\.)[a-z]*$", extract=TRUE)
tools::file_ext(x)
file_ext2(x)



