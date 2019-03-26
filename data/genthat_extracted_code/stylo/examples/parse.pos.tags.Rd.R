library(stylo)


### Name: parse.pos.tags
### Title: Extract POS-tags or Words from Annotated Corpora
### Aliases: parse.pos.tags

### ** Examples

text = "I_PRP have_VBP just_RB returned_VBN from_IN a_DT visit_NN 
  to_TO my_PRP$ landlord_NN -_: the_DT solitary_JJ neighbor_NN  that_IN 
  I_PRP shall_MD be_VB troubled_VBN with_IN ._. This_DT is_VBZ certainly_RB 
  a_DT beautiful_JJ country_NN !_. In_IN all_DT England_NNP ,_, I_PRP do_VBP 
  not_RB believe_VB that_IN I_PRP could_MD have_VB fixed_VBN on_IN a_DT 
  situation_NN so_RB completely_RB removed_VBN from_IN the_DT stir_VB of_IN 
  society_NN ._."

parse.pos.tags(text, tagger = "stanford", feature = "word")
parse.pos.tags(text, tagger = "stanford", feature = "pos")
  



