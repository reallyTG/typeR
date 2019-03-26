library(jqr)


### Name: vars
### Title: Variables
### Aliases: vars vars_

### ** Examples

x <- '{
 "posts": [
   {"title": "Frist psot", "author": "anon"},
   {"title": "A well-written article", "author": "person1"}
 ],
 "realnames": {
   "anon": "Anonymous Coward",
   "person1": "Person McPherson"
 }
}'

x %>% dotstr(posts[])
x %>% dotstr(posts[]) %>% string
x %>% vars(realnames = names) %>% dotstr(posts[]) %>%
   build_object(title, author = "$names[.author]")



