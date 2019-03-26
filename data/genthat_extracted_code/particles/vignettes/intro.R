## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
set.seed(1)

## ---- message=FALSE------------------------------------------------------
library(particles)
library(tidygraph)

sim <- create_ring(10) %>% 
  simulate(velocity_decay = 0.6, setup = petridish_genesis(vel_max = 0)) %>% 
  wield(link_force) %>% 
  wield(manybody_force) %>% 
  impose(polygon_constraint, 
         polygon = cbind(c(-100, -100, 100, 100), c(-100, 100, 100, -100))) %>% 
  evolve(100)

## ------------------------------------------------------------------------
sim

## ---- message=FALSE------------------------------------------------------
library(ggraph)
ggraph(as_tbl_graph(sim)) + 
  geom_edge_link() + 
  geom_node_point() + 
  theme_void()

## ---- message=FALSE------------------------------------------------------
sim <- sim %>% 
  unwield(2) %>% 
  wield(manybody_force, strength = 30) %>% 
  reheat(1) %>% 
  evolve()

ggraph(as_tbl_graph(sim)) + 
  geom_edge_link() + 
  geom_node_point() + 
  theme_void()

## ---- message=FALSE------------------------------------------------------
sim <- play_islands(3, 10, 0.6, 3) %>% 
  mutate(group = group_infomap()) %>% 
  activate(edges) %>% 
  mutate(weight = ifelse(.N()$group[to] == .N()$group[from], 1, 0.25)) %>% 
  simulate() %>% 
  wield(link_force, strength = weight, distance = 10/weight) %>% 
  evolve()

ggraph(as_tbl_graph(sim)) + 
  geom_edge_link(aes(width = weight), alpha = 0.3, lineend = 'round') + 
  geom_node_point() + 
  theme_void() + 
  theme(legend.position = 'none')

## ---- message=FALSE------------------------------------------------------
sim <- sim %>% 
  activate(edges) %>% 
  mutate(weight = 1) %>% 
  reheat(1) %>% 
  evolve()

ggraph(as_tbl_graph(sim)) + 
  geom_edge_link(aes(width = weight), alpha = 0.3, lineend = 'round') + 
  geom_node_point() + 
  theme_void() + 
  theme(legend.position = 'none')

## ------------------------------------------------------------------------
volcano_field <- (volcano - min(volcano)) / diff(range(volcano)) * 2 * pi
sim <- create_empty(1000) %>% 
  simulate(alpha_decay = 0, setup = aquarium_genesis(vel_max = 0)) %>% 
  wield(reset_force, xvel = 0, yvel = 0) %>% 
  wield(field_force, angle = volcano_field, vel = 0.1, xlim = c(-5, 5), ylim = c(-5, 5)) %>% 
  evolve(100, record)

traces <- data.frame(do.call(rbind, lapply(sim$history, position)))
names(traces) <- c('x', 'y')
traces$particle <- rep(1:1000, 100)

ggplot(traces) +
  geom_path(aes(x, y, group = particle), size = 0.1) + 
  theme_void() + 
  theme(legend.position = 'none')

