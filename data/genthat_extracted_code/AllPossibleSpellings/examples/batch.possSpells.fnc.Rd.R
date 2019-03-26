library(AllPossibleSpellings)


### Name: batch.possSpells.fnc
### Title: Batch processing function for possSpells.fnc.
### Aliases: batch.possSpells.fnc

### ** Examples

# create and save first word list
words<-c("d_ZZZ_s_t_I_t",
         "j_u_l_o",
         "f_A_m"
)
save(words,file="some.words.rda")

# create and sve second word list
words<-c("ZZZ_k_s_@_d_O_f_t",
	 "b_E_N",
	 "b_r_I_l_t"
)
save(words,file="other.words.rda")

# create and save third word list
words<-c("g_r_ZZZ_dZ",
         "k_e_v_I_t",
         "k_o_l_E_p"
)
save(words,file="more.words.rda")

# create and save fourth word list
words<-c("k_l_u_t_l",
	 "d_ZZZ_g_o_s_o",
	 "d_r_i_g_b_l_A_m"
)
save(words,file="yet.more.words.rda")

# create the vector of file names
files=c("some.words.rda",
	"other.words.rda",
	"more.words.rda",
	"yet.more.words.rda"
)

# process the files
# The list of possible spellings for each 
# word list are saved as a '.txt' file 
# in the current directory, e.g., 'some.words.txt'.
batch.possSpells.fnc(fn=files)



