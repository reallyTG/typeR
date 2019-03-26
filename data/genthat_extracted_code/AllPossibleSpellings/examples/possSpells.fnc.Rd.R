library(AllPossibleSpellings)


### Name: possSpells.fnc
### Title: Get all of a word's possible spellings.
### Aliases: possSpells.fnc

### ** Examples

# create a list of words
word.list<-c("d_ZZZ_s_t_I_t",
	     "j_u_l_o",
	     "f_A_m"
)
(as.matrix(word.list))

# process the words
x<-possSpells.fnc(word.list)
(matrix(x,ncol=4,nrow=29))



