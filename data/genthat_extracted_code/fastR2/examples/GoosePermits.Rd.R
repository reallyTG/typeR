library(fastR2)


### Name: GooosePermits
### Title: Goose permits
### Aliases: GooosePermits

### ** Examples

goose.mod <- glm( cbind(sell, keep) ~ log(bid), data = GoosePermits, family = binomial())
gf_point(0 ~ bid, size = ~keep, color = "gray50", data = GoosePermits) %>%
  gf_point(1 ~ bid, size = ~ sell, color = "navy") %>%
  gf_function(fun = makeFun(goose.mod)) %>%
  gf_refine(guides(size = "none"))
  
ggplot(data = GoosePermits) +
  geom_point( aes(x = bid, y = 0, size = keep), colour = "gray50") +
  geom_point( aes(x = bid, y = 1, size = sell), colour = "navy") +
  stat_function(fun = makeFun(goose.mod)) +
  guides( size = "none")
  
gf_point( (sell / (sell + keep)) ~ bid, data = GoosePermits,
    size = ~ sell + keep, color = "navy") %>%
  gf_function(fun = makeFun(goose.mod))  %>%
  gf_text(label = ~ as.character(sell + keep), colour = "white", size = 3) %>%
  gf_refine(scale_size_area()) %>% 
  gf_labs(y = "probabity of selling")
  
ggplot(data = GoosePermits) +
  stat_function(fun = makeFun(goose.mod)) +
  geom_point( aes(x = bid, y = sell / (sell + keep), size = sell + keep), colour = "navy") +
  geom_text( aes(x = bid, y = sell / (sell + keep), label = as.character(sell + keep)), 
    colour = "white", size = 3) +
  scale_size_area() + 
  labs(y = "probabity of selling")
  



