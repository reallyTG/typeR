library(container)


### Name: dequeS3
### Title: Deque (double-ended queue) constructors
### Aliases: dequeS3 deque as.deque is.deque addleft count peekleft popleft
###   reverse rotate

### ** Examples

# addleft
d <- 2 + deque(1L)
values(d)                                          # 2 1
values(3:1 + deque(0L))                 # 3 2 1 0

# count
count(deque(c("Lisa", "Bob", "Bob")), "Bob")     # 2

# peek and pop
d <- deque(1:3)
peek(d)                # 3
pop(d)                 # 3
pop(d)                 # 2
pop(d)                 # 1
## Not run: 
##D d$pop()              # Error: pop at empty Deque
## End(Not run)

d <- deque(1:3)
print(d)
reverse(d)   # 3 2 1
print(d)

rotate(d)
values(d)                           # 1 3 2
values(rotate(d, -1))               # 3 2 1
values(rotate(d, 2))               # 2 1 3



